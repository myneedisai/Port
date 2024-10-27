const fs = require('fs');
const path = require('path');

exports.handler = async (event) => {
    const filePath = path.join(__dirname, 'hello.html');
    const htmlContent = fs.readFileSync(filePath, 'utf8');

    return {
        statusCode: 200,
        headers: {
            'Content-Type': 'text/html',
        },
        body: htmlContent,
    };
};
