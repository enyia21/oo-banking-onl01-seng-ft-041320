require "pry"
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @amount = transfer_amount
    @status = "pending"
    @transactions = 0
  end

  def valid?()
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if status == "pending" && sender.valid? && receiver.valid? && sender.balance > self.amount
      sender.deposit(-self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    elsif sender.valid? && receiver.valid? == false || sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.status
    end
    # binding.pry
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.deposit(-self.amount)
      sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
end
