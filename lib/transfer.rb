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
    if sender.balance < self.amount || !sender.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status != "complete" && sender.valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = "rejected"
      #self.amount = 50
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
      @receiver.balance -= amount
      @sender.balance += amount
      @status = "reversed"
    end
  end

end
