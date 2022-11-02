import Principal "mo:base/Principal";

import Ledger "../src/Ledger";
import Types "../src/LedgerTypes";


/*
deploy:

// export PRINCIPAL_ID=$(dfx canister id Ledger)

export PRINCIPAL_ID=ryjl3-tyaaa-aaaaa-aaaba-cai
dfx canister install Test --argument '(principal "'${PRINCIPAL_ID}'")' --mode='reinstall'
dfx deploy Test --argument '(principal "'${PRINCIPAL_ID}'")'

*/
actor class test(_ledgerCanisterId: Principal)  {
  let ledger = Ledger.Ledger(_ledgerCanisterId);

}