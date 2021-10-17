module.exports = (config) => {
    config.set({
        browsers: [
            'FirefoxMAC',
            'ChromeMAC',
            'OperaMAC',

            'FirefoxWIN',
            'ChromeWIN',
            'OperaWIN',

            'AndroidSamsung',
            'AndroidPixel',

            // Safari all platforms 2/53 errors: openCursor() FAILED / openKeyCursor() FAILED
            // 'SafariMAC',
            // 'SafariiPhone11',
            // 'SafariiPadAir4',
        ],
        files: [
            'dist/karma/index.js',
        ],
        frameworks: [
            'mocha',
        ],
        plugins: [
            'karma-browserstack-launcher',
            'karma-mocha',
        ],
        reporters: [
            'dots',
            'BrowserStack',
        ],
        singleRun: true,
        client: {
            mocha: {
                timeout: 10000,
            },
        },
        browserStack: {
            username: process.env.BROWSERSTACK_USERNAME,
            accessKey: process.env.BROWSERSTACK_ACCESSKEY,
            timeout: 1500,
            captureTimeout: 500,
        },
        customLaunchers: {
            // Automate (Selenium)
            // https://www.browserstack.com/list-of-browsers-and-platforms/automate
            // https://www.browserstack.com/docs/automate/selenium/getting-started/nodejs#run-your-first-test
            // https://github.com/karma-runner/karma-browserstack-launcher

            // https://www.browserstack.com/docs/automate/selenium/select-browsers-and-devices#capability-override-rules
            // https://www.browserstack.com/docs/automate/selenium/select-browsers-and-devices#browserstack-specific-capabilities-desktop

            // "browserstack.console" - for Chrome only right now:
            // https://www.browserstack.com/docs/automate/selenium/debugging-options#console-logs

            AndroidSamsung: {
                base: 'BrowserStack',
                device: 'Samsung Galaxy S21',  // choose "iPhone 12 Pro" etc.
                browser: 'Android',
                os: 'Android',
                os_version: '11.0',  // select "14" for iOS 14
                real_mobile: 'true',
            },
            AndroidPixel: {
                base: 'BrowserStack',
                device: 'Google Pixel 4 XL',
                browser: "Android",
                os: 'Android',
                os_version: "10.0",
                // real_mobile: "true",
            },
            SafariiPhone11: {
                base: 'BrowserStack',
                device: 'iPhone 11',
                browser: 'Safari',
                os: 'ios',
                os_version: '13.0',
                real_mobile: "true",
            },
            SafariiPadAir4: {
                base: 'BrowserStack',
                device: 'iPad Air 4',
                browser: 'Safari',
                os: 'ios',
                os_version: '14.0',
                real_mobile: "true",
            },
            FirefoxMAC_51: {
                base: 'BrowserStack',
                browser: 'Firefox',
                browser_version: '51',
                os: 'OS X',
                os_version: 'Sierra',
            },
            FirefoxMAC: {
                base: 'BrowserStack',
                browser: 'Firefox',
                browser_version: '93',
                os: 'OS X',
                os_version: 'Big Sur',
            },
            ChromeMAC: {
                base: 'BrowserStack',
                browser: 'Chrome',
                browser_version: '58',
                os: 'OS X',
                os_version: 'Sierra',
                "browserstack.console": "verbose"
            },
            SafariMAC_10: {
                base: 'BrowserStack',
                browser: 'Safari',
                browser_version: '10.1',
                os: 'OS X',
                os_version: 'Sierra',
            },
            SafariMAC: {
                base: 'BrowserStack',
                browser: 'Safari',
                os: 'OS X',
                os_version: 'Big Sur',
            },
            OperaMAC: {
                base: 'BrowserStack',
                browser: 'Opera',
                browser_version: '46',
                os: 'OS X',
                os_version: 'Sierra',
            },
            FirefoxWIN: {
                base: 'BrowserStack',
                browser: 'Firefox',
                browser_version: '51',
                os: 'WINDOWS',
                os_version: '10',
            },
            ChromeWIN: {
                base: 'BrowserStack',
                browser: 'Chrome',
                browser_version: '58',
                os: 'WINDOWS',
                os_version: '10',
            },
            OperaWIN: {
                base: 'BrowserStack',
                browser: 'Opera',
                browser_version: '46',
                os: 'WINDOWS',
                os_version: '10',
            },
        },
    });
};
