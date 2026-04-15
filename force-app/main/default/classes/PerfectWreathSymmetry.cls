public with sharing class PerfectWreathSymmetry {
    public PerfectWreathSymmetry() {

    }

    public Boolean isSymmetric(String layout){
        Boolean symmetry = false;

        String reverseLayout = layout.reverse();
        if (String.isEmpty(layout) || layout.equals(reverseLayout)) {
            symmetry = true;
        }
        // Take existing String "layout" and reverse, saving to new String
        // Compare Strings and save result to symmetry
        // Build for edge case of empty String
                
        return symmetry;
    }
}