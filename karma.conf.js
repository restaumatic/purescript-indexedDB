module.exports = config => {
    config.set({
        autoWatch: true,
        singleRun: true,
        browsers: ["Chrome", "Firefox"],
        // browsers: ["ChromeDebugging"],
        customLaunchers: {
            ChromeDebugging: {
              base: 'Chrome',
              flags: [ '--remote-debugging-port=9333' ]
            }
          },
        files: [
            "dist/karma/index.js",
        ],
        frameworks: [
            "mocha",
        ],
        plugins: [
            "karma-chrome-launcher",
            "karma-firefox-launcher",
            "karma-spec-reporter",
            "karma-mocha",
        ],
        reporters: ["spec"],
        client: {
            mocha: {
                timeout: 10000
            }
        }
    });
};
