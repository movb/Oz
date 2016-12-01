declare
class Account
   attr balance:0
   meth transfer(Amount)
      balance := @balance + Amount
   end
   meth getBal(B)
      B=@balance
   end
end
A={New Account transfer(100)}

declare
class VerboseAccount
   from Account
   meth verboseTransfer(Amount)
      {self transfer(Amount)}
      {Browse @balance}
   end
end

declare
class AccountWithFee
   from VerboseAccount
   attr fee:5
   meth transfer(Amount)
      VerboseAccount,transfer(Amount-@fee)
   end
end

