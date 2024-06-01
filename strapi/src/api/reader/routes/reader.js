'use strict';

/**
 * reader router
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::reader.reader');
