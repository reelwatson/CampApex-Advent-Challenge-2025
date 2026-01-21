public with sharing class CountTotalSupplies {
    public static Integer countTotalSupplies(Map<String, Integer> supplies) {
        // Your solution here
        Integer totalItems = 0;
        for (Integer itemCount : supplies.values()) {
            totalItems += itemCount;
        }

        return totalItems;
    }
}