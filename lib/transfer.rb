class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
def valid?
  self.sender.valid? && self.receiver.valid? ? true : false
end

def execute_transaction
  if valid? && self.sender.balance >= amount && @status == "pending"
    self.sender.balance -= amount
    self.receiver.balance += amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if self.status == "complete"
    self.sender.balance += amount
    self.receiver.balance -= amount
    @status = "reversed"
  end
end

end
