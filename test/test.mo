import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Debug "mo:base/Debug";

import Ledger "../src/Ledger";


/*
# -- deploy test canister --
dfx deploy Test

# -- ledger mint --

# mint
dfx identity use minter
dfx canister call ledger send_dfx \
'(
    record {
        memo = 1 : nat64;
        amount = record {e8s = 10_000_000_000 : nat64};
        fee = record {e8s = 0 : nat64};
        to =  "b027193e92043aa7fa74fedeb45bf2a70e8b58e55c4b2a205718f55096fa6611"
    }
)'
dfx identity use clankpan


*/
actor class test() = this {
  var ledger = Ledger.Ledger();

  ledger.ledgerCanister := actor("r7inp-6aaaa-aaaaa-aaabq-cai");

  public shared({caller}) func paymentAccountId(): async Text {
    ledger.paymentAccountId(Principal.fromActor(this), caller);
  };

  public shared({caller}) func takeinPayment(): async Result.Result<(Ledger.BlockIndex, Ledger.Tokens), Ledger.Error> {
    await ledger.takeinPayment(Principal.fromActor(this), caller);
  };

  public shared({caller}) func takeoutPayment(textAccountId: Ledger.TextAccountIdentifier, amountE8s: Nat64): async Result.Result<(Ledger.BlockIndex, Ledger.Tokens), Ledger.Error> {
    await ledger.takeoutPayment(textAccountId, amountE8s);
  };


}