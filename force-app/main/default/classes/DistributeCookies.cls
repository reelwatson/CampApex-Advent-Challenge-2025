public with sharing class DistributeCookies {
    public static Map<String, Object> distributeCookies(Integer totalCookies, List<String> helpers) {
        // Your solution here
        Map<String, Object> cookiesMap = new Map<String, Object>();
        
        //Calculate cookies per person (Integer cookiesPerPerson = totalCookies / helpers.size())
        Integer cookiesPerPerson = totalCookies / helpers.size();
        
        //Calculate cookies for parents (Integer leftoverForParents = totalCookies % helpers.size())
        Integer leftoverForParents = Math.mod(totalCookies,helpers.size());
        // Turns out you cannot just use % for modulo operations in Apex...
        
        // Create Map<String,Integer> "distribution" to loop over each helper (String) and their cookie count (Integer)
        Map<String,Integer> distribution = new Map<String,Integer>();
        for (String helper : helpers) {
            distribution.put(helper,cookiesPerPerson);
        }

        // Create Map<String,Object> and insert cookiesPerPerson, LeftoverForParents, distribution
        cookiesMap.put('cookiesPerPerson', cookiesPerPerson);
        cookiesMap.put('leftoverForParents', leftoverForParents);
        cookiesMap.put('distribution', distribution);
        
        return cookiesMap;
    }
}

/*

Return a Map<String, Object> containing:

'cookiesPerPerson' (Integer): how many cookies each helper gets
'leftoverForParents' (Integer): remaining cookies for Mama and Papa
'distribution' (Map<String, Integer>): map of each helper name to their cookie count

Example 1:
Input: totalCookies = 20, helpers = ['Stella', 'Finn', 'Ivy']
Output:
{
  'cookiesPerPerson' => 6,
  'leftoverForParents' => 2,
  'distribution' => {'Stella' => 6, 'Finn' => 6, 'Ivy' => 6}
}

Notes:
All helpers receive equal amounts
totalCookies >= 0
helpers list >= 1
*/