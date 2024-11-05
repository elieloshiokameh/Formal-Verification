predicate isPrefixPred(pre:string, str:string)
{
	(|pre| <= |str|) && pre == str[..|pre|]
}

predicate isNotPrefixPred(pre:string, str:string)
{
	// TODO: your formula should not contain &&
    forall i :: 0 <= i < |pre| ==> (i >= |str| || pre[i] != str[i])
}

// Sanity check: Dafny should be able to automatically prove the following lemma
lemma PrefixNegationLemma(pre:string, str:string)
	ensures  isPrefixPred(pre,str) <==> !isNotPrefixPred(pre,str)
	ensures !isPrefixPred(pre,str) <==>  isNotPrefixPred(pre,str)
{}


predicate isSubstringPred(sub:string, str:string)
{
  //TODO
  exists i :: 0 <= i <= |str| - |sub| && sub == str[i..i+|sub|]
}

predicate isNotSubstringPred(sub:string, str:string)
{
	//TODO: your FOL formula should start with a forall
    forall i :: 0 <= i <= |str| - |sub| ==> sub != (str[i..i+|sub|])
}

// Sanity check: Dafny should be able to automatically prove the following lemma
lemma SubstringNegationLemma(sub:string, str:string)
	ensures  isSubstringPred(sub,str) <==> !isNotSubstringPred(sub,str)
	ensures !isSubstringPred(sub,str) <==>  isNotSubstringPred(sub,str)
{}


predicate haveCommonKSubstringPred(k:nat, str1:string, str2:string)
{
  //TODO
    exists i, j :: 0 <= i <= |str1| - k && 0 <= j <= |str2| - k && str1[i..i+k] == str2[j..j+k]
}

predicate haveNotCommonKSubstringPred(k:nat, str1:string, str2:string)
{
	//TODO: your FOL formula should start with a forall
    forall i, j :: 0 <= i <= |str1| - k && 0  <= j <= |str2| - k ==> !(str1[i..i+k] == str2[j..j+k])
}

// Sanity check: Dafny should be able to automatically prove the following lemma
lemma commonKSubstringLemma(k:nat, str1:string, str2:string)
	ensures  haveCommonKSubstringPred(k,str1,str2) <==> !haveNotCommonKSubstringPred(k,str1,str2)
	ensures !haveCommonKSubstringPred(k,str1,str2) <==> haveNotCommonKSubstringPred(k,str1,str2)
{}