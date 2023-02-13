class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction

    def initialize discount = 0
        @discount= discount
        @total = 0
        @items = []
    end

    def add_item title, price, quantity=1
        quantity.times {self.items << title}
        @last_transaction = price * quantity 
        self.total += self.last_transaction
    end
    
    def apply_discount
        if self.discount == 0 
            "There is no discount to apply."
        else
            discount_as_percent = (100.0 - self.discount.to_f) / 100 
            self.total = (self.total * discount_as_percent).to_i 
             "After the discount, the total comes to $#{self.total}."
        end
    end


    def void_last_transaction
        self.total -= self.last_transaction
    end
    


end
