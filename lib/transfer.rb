class Transfer
	attr_accessor :sender, :receiver, :amount, :status

	@@last_transfer = nil
	def initialize(sender, receiver, amount)
		@sender = sender
		@receiver = receiver
		@amount = amount
		@status = "pending"
	end

	def executed?
		return @status == "complete"
	end

	def valid?
		return sender.valid? && receiver.valid?
	end

	def execute_transaction
		if valid? && !executed?
			if sender.balance >= @amount
				@sender.balance -= @amount
				@receiver.balance += @amount
				@status = "complete"
				@@last_transfer = self
			else 
				@status = "rejected"
				return "Transaction rejected. Please check your account balance."
			end
		end
	end

	def reverse_transfer
		require 'byebug'
		# byebug
		@@last_transfer.sender.balance += @@last_transfer.amount
		@@last_transfer.receiver.balance -= @@last_transfer.amount
		@status = 'reversed'
	end
end
