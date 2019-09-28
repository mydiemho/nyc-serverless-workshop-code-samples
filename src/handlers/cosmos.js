"use strict";

const uuidv4 = require("uuid/v4");

module.exports.write = function(context, req) {
  context.log("JavaScript HTTP trigger function processed a request.");

  const input = req.body;
  context.log(`Received data: ${JSON.stringify(input, 2, null)}`);

  const timestamp = Date.now();
  const uuid = uuidv4(); //

  const output = JSON.stringify({
    id: uuid,
    name: input.name,
    employeeId: input.employeeId,
    address: input.address,
    timestamp: timestamp
  });

  context.bindings.employeeDocument = output;

  context.log("Finish writing to CosmosDB");

  context.done();
};
