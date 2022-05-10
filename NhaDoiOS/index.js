// // javascript

// const wdio = require("webdriverio");
// const assert = require("assert");

// const opts = {
//   path: '/wd/hub',
//   port: 4723,
//   capabilities: {
//     platformName: "Android",
//     platformVersion: "10",
//     deviceName: "Pixel 3a XL API 29",
//     app: "/Users/nguyenhoangvannha/Downloads/ApiDemos-debug.apk",
//     appPackage: "io.appium.android.apis",
//     appActivity: ".view.TextFields",
//     automationName: "UiAutomator2"
//   }
// };

// async function main () {
//   const client = await wdio.remote(opts);

//   const field = await client.$("android.widget.EditText");
//   await field.setValue("Hello World!");
//   const value = await field.getText();
//   assert.strictEqual(value,"Hello World!");

//   await client.deleteSession();
// }

// main();

const webdriverio = require('webdriverio');
// const app = 'http://appium.github.io/appium/assets/TestApp7.1.app.zip';
const app = "/Users/nguyenhoangvannha/Downloads/Payload.zip";
const assert = require('chai').assert;

const serverConfig = {
    path: '/wd/hub',
    host: process.env.APPIUM_HOST || 'localhost',
    port: process.env.APPIUM_PORT || 4723,
    logLevel: 'info'
  };

  const iosCaps = {
    platformName: 'iOS',
    automationName: 'XCUITest',
    deviceName: process.env.IOS_DEVICE_NAME || 'iPhone 13',
    platformVersion: process.env.IOS_PLATFORM_VERSION || '15.4',
    app: undefined // Will be added in tests
  };
const iosOptions = Object.assign(
    {
      capabilities: iosCaps
    },
    serverConfig
  );


iosOptions.capabilities.app = app;

// describe('Basic IOS interactions', function () {
//   let client;

//   beforeEach(async function () {
//     client = await webdriverio.remote(iosOptions);
//   });

//   afterEach(async function () {
//     await client.deleteSession();
//   });

//   it('should send keys to inputs', async function () {
//     const elementId = await client.findElement('accessibility id', 'TextField1');
//     client.elementSendKeys(elementId.ELEMENT, 'Hello World!');

//     const elementValue = await client.findElement('accessibility id', 'TextField1');
//     await client.getElementAttribute(elementValue.ELEMENT, 'value').then((attr) => {
//       assert.equal(attr, 'Hello World!');
//     });
//   });

//   it('should click a button that opens an alert', async function () {
//     const element = await client.findElement('accessibility id', 'show alert');
//     await client.elementClick(element.ELEMENT);

//     assert.equal(await client.getAlertText(), 'Cool title\nthis alert is so cool.');
//   });
// });

async function main () {
  const client = await webdriverio.remote(iosOptions);

  const elementId = await client.findElement('accessibility id', 'TextField1');
    client.elementSendKeys(elementId.ELEMENT, 'Hello World!');

    const elementValue = await client.findElement('accessibility id', 'TextField1');
    await client.getElementAttribute(elementValue.ELEMENT, 'value').then((attr) => {
      assert.equal(attr, 'Hello World!');
    });

  await client.deleteSession();
}

main();