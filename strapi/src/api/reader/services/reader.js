'use strict';

/**
 * reader service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::reader.reader');
