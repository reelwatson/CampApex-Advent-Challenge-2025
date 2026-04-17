public with sharing class CountTotalSupplies {
    public static Integer countTotalSupplies(Map<String, Integer> supplies) {
        Integer totalItems = 0;
        if (supplies == null || supplies.isEmpty()) {
            throw new CustomExceptions.CountTotalSuppliesException('Your list has nothing in it!');
        }
        try {
            for (Integer itemCount : supplies.values()) {
                if (itemCount == null || itemCount.equals(0)) {
                    throw new CustomExceptions.CountTotalSuppliesException('You need to add a unit amount to the supply item you want to include');
                }
                else {
                    totalItems += itemCount;
                }
            }
        }
        catch (IllegalArgumentException iae) {
            System.debug(iae.getMessage());
        }
        catch (CustomExceptions.CountTotalSuppliesException ctse) {
            System.debug(ctse.getMessage());
        }
        catch (Exception e) {
            System.debug('We caught an unhandled exception - create a task to handle this better next time! Message: ' + e.getMessage());
        }
        return totalItems;
    }
}