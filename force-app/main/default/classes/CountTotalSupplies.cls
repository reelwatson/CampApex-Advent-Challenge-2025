public with sharing class CountTotalSupplies {
    public static Integer countTotalSupplies(Map<String, Integer> supplies) {
        Integer totalItems = 0;
        if (supplies == null || supplies.isEmpty()) {
            throw new CustomExceptions.CountTotalSuppliesException('Your list has nothing in it!');
        }
            for (Integer itemCount : supplies.values()) {
                if (itemCount == null || itemCount <= 0) {
                    throw new CustomExceptions.CountTotalSuppliesException('You need to add a positive unit amount to the supply item you want to include');
                }
                else {
                    totalItems += itemCount;
                }
            }
        return totalItems;
    }
}