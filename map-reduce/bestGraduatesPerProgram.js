//Top 5 Graduates by GPA in Each Program: Identify the top 5 graduates by GPA for each program.
//------------------------------------------------------------------Change depending on pipeline
// Define the names of the old and new collections
const oldCollection = "graduate";
const newCollection = "bestGraduates";

// Define the aggregation pipeline
var aggregationPipeline = [
    {
        $unwind: "$graduateHasPrograms"
    },
    {
        $sort: { "graduateHasPrograms.academicAvg": -1 }
    },
    {
        $group: {
            _id: "$graduateHasPrograms.program.programName",
            top_graduates: { $push: { name: "$name", gpa: "$graduateHasPrograms.academicAvg" } }
        }
    },
    {
        $project: {
            _id: 0,
            program: "$_id",
            top_graduates: { $slice: ["$top_graduates", 5] }
        }
    },
    { $out: newCollection }    
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



