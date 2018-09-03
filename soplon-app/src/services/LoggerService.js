let LoggerService = {};

(function () {
  this.logLevel = process.env.LOG_LEVEL || 'INFO'
  let self = this

  this.debug = function () {
    if (self.logLevel.toUpperCase() === 'DEBUG') {
      for (let i = 0; arguments.length && i < arguments.length; i++) {
        console.log(arguments[i])
      }
    }
  }
  this.info = function () {
    if (self.logLevel.toUpperCase() === 'INFO') {
      for (let i = 0; arguments.length && i < arguments.length; i++) {
        console.log(arguments[i])
      }
    }
  }
  this.warn = function () {
    if (self.logLevel.toUpperCase() === 'WARN') {
      for (let i = 0; arguments.length && i < arguments.length; i++) {
        console.log(arguments[i])
      }
    }
  }
  this.error = function () {
    if (self.logLevel.toUpperCase() === 'ERROR') {
      for (let i = 0; arguments.length && i < arguments.length; i++) {
        console.log(arguments[i])
      }
    }
  }
}).apply(LoggerService)

export default LoggerService
