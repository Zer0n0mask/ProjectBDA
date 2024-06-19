//Genders by program
//------------------------------------------------------------------Change depending on pipeline
// Define the names of the old and new collections
const oldCollection = "graduate";
const newCollection = "gendersPerProgramPerUniversity";

// Define the aggregation pipeline
var aggregationPipeline = [
  {
    "$unwind": "$graduateHasPrograms"
  },
  {
    "$unwind": "$graduateHasPrograms.program"
  },
  {
    "$group": {
      "_id": {
        "universityName": "$graduateHasPrograms.program.universityName",
        "programName": "$graduateHasPrograms.program.programName"
      },
      "numberMale": {
        "$sum": {
          "$cond": [{ "$eq": ["$gender", "M"] }, 1, 0]
        }
      },
      "numberFemale": {
        "$sum": {
          "$cond": [{ "$eq": ["$gender", "F"] }, 1, 0]
        }
      },
      "numberOther": {
        "$sum": {
          "$cond": [{ "$eq": ["$gender", "Other"] }, 1, 0]
        }
      }
    }
  },
  {
    "$group": {
      "_id": "$_id.universityName",
      "programs": {
        "$push": {
          "programName": "$_id.programName",
          "numberMale": "$numberMale",
          "numberFemale": "$numberFemale",
          "numberOther": "$numberOther"
        }
      }
    }
  },
  {
    "$project": {
      "_id": 0,
      "universityName": "$_id",
      "programs": 1
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

