# ICP

```
service = {
  paymentAccountId: (Principal, Principal) -> Text; //(controller, userPrincipal);
  takeinPayment: (Principal, Principal) -> async Result.Result<(BlockIndex, Tokens), Error>;
  takeoutPayment: (Text, Nat64) -> async Result.Result<(BlockIndex, Tokens), Error>;
};