'use strict';

/**
 * Test documentation project.
 * This is a new line.
 *
 * @module doctest
 * @exports doctest
 * @property {function} start - {@link #module_doctest..start}
 * @property {function} another - {@link #module_doctest..another}
 */

/**
 * Start something.
 *
 * @return {boolean} true if started false otherwise.
 */
function start() {
  return Math.random() >= 0.5;
}

/**
 * Does another thing.
 *
 * @return {undefined} nothing
 */
function another() {
  eval('alert("best function")');
}

module.exports = {
  start: start
};
