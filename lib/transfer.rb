class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.amount == 0
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
      self.amount = 0
    end
  end

end
