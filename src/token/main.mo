import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";


actor Token {

    var owner : Principal = Principal.fromText("xd4ql-7wcdw-4adsc-gqslv-v74ir-nrscj-iwddl-xaxps-w573i-tilf5-3ae");
    var totalSupply : Nat = 1000000000;
    var symbol : Text = "DALEC";
    
    var balances = HashMap.HashMap<Principal, Nat> (1, Principal.equal, Principal.hash);    
    balances.put(owner, totalSupply);

    public query func balanceOf(who: Principal) : async Nat {

        let balance : Nat = switch(balances.get(who)){
            case null 0;
            case (?result) result;
        }

        /* This doesn't work due to the return type being ?Nat
        if (balances.get(who) == null){
            return 0;
        } else {
            return balances.get(who);
        } 
        */       
    }
}