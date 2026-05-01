
@IsTest
private class MixPlaylistTest {

    @IsTest
    static void positiveTestAllLowerCase() {
        List<String> carols = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'O Come Emmanuel'};
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'cclccl';
        Integer playlistLength = 6;
        List<String> expected = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'You Are My Sunshine', 'O Come Emmanuel', 'Silent Night', 'Brother John'};

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.areEqual(expected, actual, 'The playlist should have been ' + expected + ', instead was ' + actual);
        
    }

    @isTest
    static void positiveTestAllUpperCase() {
        List<String> carols = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'O Come Emmanuel'};
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'LLCLLC';
        Integer playlistLength = 6;
        List<String> expected = new List<String>{'You Are My Sunshine', 'Brother John', 'Silent Night', 'Winnie the Pooh', 'Twinkle Twinkle', 'God Rest Ye Merry Gentlemen'};

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.areEqual(expected, actual, 'The playlist should have been ' + expected + ', instead was ' + actual);

    }

    @isTest
    static void positiveTestUpperAndLowerCase() {
        List<String> carols = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'O Come Emmanuel'};
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'cLCl';
        Integer playlistLength = 4;
        List<String> expected = new List<String>{ 'Silent Night', 'You Are My Sunshine', 'God Rest Ye Merry Gentlemen', 'Brother John'};

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.areEqual(expected, actual, 'The playlist should have been ' + expected + ', instead was ' + actual);

    }

    @isTest
    static void emptyCarolsOrLullabiesList() {
        List<String> carols = new List<String>();
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'cLCl';
        Integer playlistLength = 4;

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.isNull(actual, 'The playlist should have returned empty because the carols list is empty.');
    }

    @isTest
    static void patternDoesNotHaveCOrL() {
        List<String> carols = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'O Come Emmanuel'};
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'prpr';
        Integer playlistLength = 4;

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.isTrue(actual.isEmpty(), 'The playlist should have returned empty because the pattern did not contain c or l.');

    }

    @isTest
    static void patternHadAdditionalLetters() {
        List<String> carols = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'O Come Emmanuel'};
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'clpr';
        Integer playlistLength = 4;

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.isTrue(actual.isEmpty(), 'The playlist should have returned empty because the pattern contained letters other than c or l.');

    }

    @isTest
    static void playlistLengthLessThanOne() {
        List<String> carols = new List<String>{'Silent Night', 'God Rest Ye Merry Gentlemen', 'O Come Emmanuel'};
        List<String> lullabies = new List<String>{'You Are My Sunshine','Brother John', 'Winnie the Pooh', 'Twinkle Twinkle'};

        String pattern = 'clpr';
        Integer playlistLength = 0;

        Test.startTest();
        MixPlaylist mixPlaylist = new MixPlaylist();
        List<String> actual = mixPlaylist.mixPlaylist(carols, lullabies, pattern, playlistLength);
        Test.stopTest();

        Assert.isTrue(actual.isEmpty(), 'The playlist should have returned empty because the playlistLength was less than 1.');

    }
}