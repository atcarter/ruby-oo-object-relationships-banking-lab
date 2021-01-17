class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(send, receive, amt)
    @sender = send
    @receiver = receive
    @amount = amt
    @status = "pending"
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end

  end

  def execute_transaction
    if self.sender.balance < self.amount || self.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending" && self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "complete"
    end

  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else

    end
  end
end
