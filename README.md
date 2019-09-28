# Azure Functions

Refer to [Serverless docs](https://serverless.com/framework/docs/providers/azure/guide/intro/) for more information.

Sample showing how to write to CosmosDB given data coming in to a HTTP-trigger.

## Guide

### Create CosmoDB account

```bash
./scripts/create-cosmos-db.sh
```

Pick one of the NON read-only connection strings output from the scripts. Set it as environment variable

```bash
export COSMOS_DB_CONNECTION=<CHANGE_ME>
```

### Deploy app

```bash
npm run deploy
```

### Test endpoint

1. Post data to the cosmos endpoint

   - Make a post request with the data in `sample.json`
   - Or use the invoke command

     ```bash
     npm run cosmos
     ```

1. Use [Storage Explorer](https://docs.microsoft.com/en-us/azure/vs-azure-tools-storage-manage-with-storage-explorer) to verify that a new document has been added to your CosmosDB container.

## References

[CosmosDB Javascript Doc](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-cosmosdb-v2#output---javascript-examples)

[CosmosDB Binding Configuration](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-cosmosdb-v2#output---configuration)

[Context Done Method](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-node#contextdone-method)
