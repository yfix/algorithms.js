'use strict';

var insertionSort = require('../../../algorithms/sorting/insertion_sort'),
    sortingTestsHelper = require('./sorting_tests_helper');

describe('Insertion Sort', function () {
  it('should sort the given array', function () {
    sortingTestsHelper.testSort(insertionSort);
  });


  it('should sort the array with a specific comparison function', function () {
    sortingTestsHelper.testSortWithComparisonFn(insertionSort);
  });
});
