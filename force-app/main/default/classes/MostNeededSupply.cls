public with sharing class MostNeededSupply {
    public String findMostNeededSupply(List<String> shoppingList) {
        // Your solution here
        String mostNeededItem;

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