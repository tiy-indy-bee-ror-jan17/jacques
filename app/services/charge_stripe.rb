class ChargeStripe

  attr_accessor :user,
                :amount,
                :result,
                :customer,
                :token

  def initialize(user, token, amount)
    self.user = user
    self.token = token
    self.amount = amount
  end

  def charge_them
    create_customer # unless user.customer_id
    charge_customer
    output_result
  end

  def create_customer
    self.customer = Stripe::Customer.create(
      :email => user.email,
      :source  => token
    )
  end

  def charge_customer
    begin
      Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => amount,
        :description => 'Notemeister cover charge',
        :currency    => 'usd'
      )
      self.result = {success: true}
    rescue Stripe::CardError => e
      self.result = {error: e.message}
    end
  end

  def output_result
    result
  end

end
