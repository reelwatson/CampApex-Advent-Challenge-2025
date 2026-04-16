public with sharing class CalculateThreadNeeded {
    public Integer calculateThreadNeeded(List<String> names, Map<String, Integer> threadPerLetter) {
        // Your solution here
        //if names is empty return 0
        // TO DO: Refactor code to handle if letter does not have match in threadPerLetter map

        if (names.isEmpty() || names == null || threadPerLetter == null || threadPerLetter.isEmpty()) {
            return 0;
        }

        Integer neededThread = 0;
        List<String> letters = new List<String>();
        try {
        // for each String in names
        for (String name : names) {

            // Add all letters to a List<String> (letters) where each letter is a separate entry
            for (Integer i = 0; i < name.length(); i++) {
                // TO DO: Add IF statement to throw Exception when name is blank/null
                if (String.isEmpty(name) || String.isBlank(name)) {
                    throw new CalculateThreadNeededException('You cannot have blank or null entries in the list of names.');
                }
                else {
                    letters.add(name.substring(i,i+1));
                }     
            }
        }
        // in new loop, for each letter (String letter : letters)
        for (String letter : letters) {
            if (threadPerLetter.containsKey(letter) && threadPerLetter.get(letter) > 0) {
                // find each value per String key (letter) in threadPerLetter
                // add to total sum of neededThread
                neededThread += threadPerLetter.get(letter);
            }
            else if (threadPerLetter.containsKey(letter) && threadPerLetter.get(letter) <= 0) {
                throw new CalculateThreadNeededException('The corresponding thread length for ' + letter + ' is less than or equal to zero');
            }
            else {
                throw new CalculateThreadNeededException('Could not find the letter ' + letter + ' in the provided map of letters and thread length.');
            }
        }
        return neededThread;
    }
    catch (CalculateThreadNeededException ctne) {
        System.debug('Calculate Thread Needed exception caught: ' + ctne.getMessage());
        return 0;
    }
    catch (Exception e) {
        System.debug('We hit an unexpected error' + e.getMessage());
        return 0;
    }
    }
}

/*
Your method receives:
names (List): names to embroider
threadPerLetter (Map<String, Integer>): map of each letter (uppercase) to inches of thread needed
Return an Integer representing total inches of thread needed for all names.

Example 1:

Input: names = ['MAMA', 'PAPA'], threadPerLetter = {'M' => 5, 'A' => 4, 'P' => 5}
Output: 36

**Explanation**: MAMA = 5+4+5+4 = 18. PAPA = 5+4+5+4 = 18. Total = 36.

Notes:

All names will be uppercase letters only
All letters in the names will be present in the threadPerLetter map
Names can have repeated letters (count each occurrence)
Return 0 if names list is empty
Thread amounts are in inches (positive integers)
*/