module.exports = {
  transform: {
    "^.+\\.jsx?$": "babel-jest"
  },
   // Other Jest configuration
  reporters: [
    "default",
    ["jest-junit", { outputDirectory: "test-results/jest", outputName: "results.xml" }]
  ],
};
