public with sharing class EvaluatePasswordStrength {
    public String EvaluatePasswordStrength(String password) {
        String strength = 'weak';
        Integer points = 0;

        // Points system to calculate total and thus strength of password

        // if statements for each condition? 
        // more efficient way to do this?

        // if password.length() >= 8
        // if !password.isAllLowerCase() AND !password.isAllUpperCase();
        // if password.containsAny(String of numbers?)
        // if password.containsAny(String of symbols)
        
        // if/else statements to review points and determine returned String

        return strength;
    }
}

/*
Finn is helping Mama & Papa set up secure systems 
for all their new parenting accounts, 
like the login for the baby monitor 
and login for thier new diaper subscription. 
He needs to ensure all passwords meet proper security standards 
to keep everything safe. 🔒


Given a password string, 
evaluate its strength and return "weak", "medium", or "strong" 
based on how many security rules it meets.


The security rules are:
At least 8 characters long
Contains both uppercase and lowercase letters
Contains at least one number
Contains at least one special character: !, @, #, %, ^, &, *

Scoring:

Weak: Fewer than 2 rules met
Medium: 2 or 3 rules met
Strong: All 4 rules met

The password may contain any characters
Special characters are limited to: !, @, #, $, %, ^, &, *
Empty string should return "weak"
Evaluation is case-sensitive

*/