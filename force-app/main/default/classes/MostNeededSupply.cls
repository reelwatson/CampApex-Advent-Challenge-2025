public with sharing class MostNeededSupply {
    public String findMostNeededSupply(List<String> shoppingList) {
        // Your solution here
        String mostNeededItem;
        Map<String, Integer> supplyMap = new Map<String, Integer>();

        for (String shoppingListItem : shoppingList) {
            // Here need to check if key (shoppingListItem) already exists
            if (supplyMap.containsKey(shoppingListItem)) {
                // If yes then add to value (value + 1) of existing key
                // We can use .put() and not duplicate because keys are treated as a Set
                supplyMap.put(shoppingListItem, supplyMap.get(shoppingListItem) + 1);
            }
            // If no then create new key with value of 1
            else {
                supplyMap.put(shoppingListItem, 1);
            }
        }

        // Check map to see which key has highest value
        // List of all values
        List<Integer> supplyList = supplyMap.values();
        // .sort() method to order list by ascending
        supplyList.sort();
        // get max value of the list
        Integer maxSupplyItem = supplyList[supplyList.size() - 1];

        // Return the keys with the highest value (for loop)
        for (String key : shoppingList) {
            if (supplyMap.get(key) == maxSupplyItem) {
                mostNeededItem = key;
                // If tie then return the first key (earliest key in shoppingList
                break;
            }
        }
        return mostNeededItem;
    }
}

/*
Mama is making a shopping list with the help of her friends! 
She compiled a list from all the supplies her friends shared with her. 
She's looking over what she wrote down and noticed some duplicates! 
Now she wants to know which item appears most frequently on her list. 🛒


Given a list of supply items (representing each time an item was added to the shopping list), 
find which item appears most frequently.


Your method receives:

shoppingList (List): list of supply items (may have duplicates)
Return a String representing the most frequently needed supply. 
If there's a tie, return the item that appears first in the list.

Notes:

Item names are case-sensitive ('Diapers' and 'diapers' are different),
so take into account when reviewing items (.toLowerCase())

List will always have at least 1 item
(shoppingList.size() always >= 1)

If multiple items have the same highest frequency, return the one 
that appears first in the original list

Use a Map to track frequencies

Iterate through the list to maintain first-appearance order

Test Example 1:
Input: shoppingList = ['Diapers', 'Wipes', 'Diapers', 'Diapers', 'Wipes']
Output: 'Diapers'
*/