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
    if sender.balance < self.amount
      self.status = "rejected"
      sender.status = "rejected"
    end
    binding.pry
    if status == "pending" && sender.valid? && receiver.valid?
      sender.deposit(-self.amount)
      receiver.deposit(self.amount)
      self.status = "complete"
    elsif sender.valid? && receiver.valid? == false || sender.status == "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.status
    end
    binding.pry
  end
end
