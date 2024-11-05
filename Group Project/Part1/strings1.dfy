method isPrefix(pre: string, str: string) returns (res: bool)
{
    // Check if the length of pre is greater than str
    if |pre| > |str| {
        res := false;
        return;
    }
    // Check if str starts with pre
    res := str[..|pre|] == pre;
}

method isSubstring(sub: string, str: string) returns (res: bool)
{
    var n := |str|;
    var m := |sub|;

    if m > n {
        res := false;
        return;
    }

    // Iterate through str to find sub
    var i := 0;
    res := false;
    while i <= n - m
    {
        var prefixCheck := isPrefix(sub, str[i..]);
        if prefixCheck {
            res := true;
            return;
        }
        i := i + 1;
    }
}

method haveCommonKSubstring(k: nat, str1: string, str2: string) returns (found: bool)
{
    found := false;
    var n1 := |str1|;

    if k == 0 {
        found := true;
        return;
    }

    // Check all substrings of length k in str1
    var i := 0;
    while i <= n1 - k {
        var substr1 := str1[i..i+k];
        var substringCheck := isSubstring(substr1, str2);
        if substringCheck {
            found := true;
            return;
        }
        i := i + 1;
    }
}

method maxCommonSubstringLength(str1: string, str2: string) returns (len: nat)
{
    var maxLen := 0;
    var n1 := |str1|;
    var n2 := |str2|;

    // Start with the longest possible substring length and work backwards
    var k := if n1 < n2 then n1 else n2;
    while k > 0 {
        var commonSubstringCheck := haveCommonKSubstring(k, str1, str2);
        if commonSubstringCheck {
            maxLen := k;
            break;
        }
        k := k - 1;
    }

    len := maxLen;
}
