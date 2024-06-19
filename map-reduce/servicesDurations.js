//Services per Duration
//------------------------------------------------------------------Change depending on pipeline
// Define the names of the old and new collections
const oldCollection = "service";
const newCollection = "servicesDurations";

// Define the aggregation pipeline
var aggregationPipeline = [
  {
    $project: {
      duration: {
        $switch: {
          branches: [
            {
              case: { $lt: [{ $subtract: ["$finalDate", "$startDate"] }, 1000 * 60 * 60 * 24] },
              then: "less than 1 day"
            },
            {
              case: { $lt: [{ $subtract: ["$finalDate", "$startDate"] }, 1000 * 60 * 60 * 24 * 3] },
              then: "1 to 3 days"
            },
            {
              case: { $lt: [{ $subtract: ["$finalDate", "$startDate"] }, 1000 * 60 * 60 * 24 * 7] },
              then: "4 to 7 days"
            },
            {
              case: { $lt: [{ $subtract: ["$finalDate", "$startDate"] }, 1000 * 60 * 60 * 24 * 14] },
              then: "1 to 2 weeks"
            }
          ],
          default: "more than 2 weeks"
        }
      }
    }
  },
  {
    $group: {
      _id: "$duration",
      count: { $sum: 1 }
    }
  },
  {
    "$out": newCollection
  }
];
//------------------------------------------------------------------Change depending on pipeline

// Connect to the MongoDB database
const db = connect('mongodb://localhost:27017/grad');

// Function to check if a collection exists
function collectionExists(db, collectionName) {
    return db.getCollectionNames().indexOf(collectionName) !== -1;
}

// Function to run the aggregation and create the new collection if it doesn't exist
function createCollectionIfNotExists(db, oldCollection, newCollection, aggregationPipeline) {
    if (!collectionExists(db, newCollection)) {
        // Run the aggregation pipeline to create the new collection
        db[oldCollection].aggregate(aggregationPipeline);
        print(`Collection '${newCollection}' created by aggregation pipeline.`);
    } else {
        print(`Collection '${newCollection}' already exists.`);
    }
}


// Run the function to create the collection if it doesn't exist
createCollectionIfNotExists(db, oldCollection, newCollection, aggregationPipeline);

// Query and print the newly created collection
const results = db[newCollection].find().toArray();
printjson(results);

