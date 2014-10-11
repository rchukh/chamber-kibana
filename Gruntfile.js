module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        changelog: {
            options: {
            },
        }
    })

    grunt.loadNpmTasks('grunt-conventional-changelog');
    grunt.registerTask('default', ['changelog']);
};