# Azure Logic Apps OpenAPI documentation

## Fetching OpenAPI definitions from Logic Apps

Azure has an endpoint for fetching OpenAPI definitions `POST https://management.azure.com/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Logic/workflows/{workflowName}/listSwagger?api-version=2016-06-01`. The result of the request will be a json body.

## Building a static html file based on OpenAPI definitions

There are various approaches:

- [Redoc](https://github.com/Redocly/redoc#redoc-cli)

Redoc is simple to use. You need node and npm installed then you can run the following command: `npx redoc-cli bundle -o index.html swagger.json`. This will generate an html file based on json definitions.

- [Swagger UI](https://github.com/swagger-api/swagger-ui)

The Swagger UI npm package will generate a familiar Swagger interface. This needs a little bit more setup than the previous approach:

```html
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Integrations Docs</title>

    <link rel="stylesheet" href="https://unpkg.com/swagger-ui-dist@4.5.0/swagger-ui.css">
    <script src="https://unpkg.com/swagger-ui-dist@4.5.0/swagger-ui-bundle.js"></script>
    <script>
        function render() {
            SwaggerUIBundle({
                url: `http://localhost:8000/swagger.json`,
                dom_id: '#swagger-ui'
            })
        }
    </script>
</head>
<body onload="render()">
    <div id="swagger-ui"></div>
</body>
</html>
```

We need to load the `css` and `js` code from `https://unpkg.com/swagger-ui-dist`, then the library will handle everything for us. We just need to point it to the OpenAPI definitions file.

## Hosting the static html file

We could use Azure Storage Account to store this html file. Then point the customers/users to that URL from the main app?

## Pipeline integration

![Sequence Diagram](./out/laOpenAPIDocs/Azure%20Logic%20Apps%20OpenAPI%20documentation.png)
