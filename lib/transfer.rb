class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = "pending"
  	@amount = amount
  end

  def valid?
  	@sender.valid? && @receiver.valid?
  end

  def execute_transaction
  	if @status == "pending"
  		@sender.balance -= amount
  		@receiver.balance += amount
  		@status = "complete"
  	end

  	if !@sender.valid?
  		@status = "rejected"
  		return "Transaction rejected. Please check your account balance."
  	end

  	# binding.pry
  end

  def reverse_transfer
  	if @status == "complete"
  		@sender.balance += amount
  		@receiver.balance -= amount
  		@status = "reversed"
  	end
  end
end
