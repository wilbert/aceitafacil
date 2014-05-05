# encoding: utf-8

require 'spec_helper'

describe Aceitafacil::Vendor do
  let(:vendor_params) { 
    { 
      id: "2", name: "Vendor name", email: "vendor@vendor.com", 
      bank: { 
        code: "001", 
        agency: "123-4", 
        account_type: 1, # 1 Corrent, 2 Poupança
        account_number: "1234-5", 
        account_holder_name: "Fulano",
        account_holder_document_type: 1, # 1 CPF, 2 CNPJ
        account_holder_document_number: "12345678909"
      } 
    } 
  }

  before do
    @vendor = Aceitafacil::Vendor.new(vendor_params)
  end

  describe "fetching existent vendors" do
    it "should be nil if customer_id is not passed" do
      @vendor = Aceitafacil::Vendor.find(nil) 
      @vendor.should be_nil
    end

    # it "should return a list vendors" do
    #   @vendor = Aceitafacil::Vendor.find(2)
      
    #   @vendor.id.should == vendor_params[:id]
    #   @vendor.name.should == vendor_params[:name]
    #   @vendor.email.should == vendor_params[:email]
    # end
  end

  describe "making a update call" do
    it do 
      response = @vendor.update
      response.should be_kind_of Net::HTTPSuccess
    end

    it "should update a remote vendor" do
      @vendor.name = "Chuck Norris"
      @vendor.update
      @vendor = Aceitafacil::Vendor.find(2)
      @vendor.name.should eq("Chuck Norris")
    end
  end  

  # describe "making a save call" do
  #   it "should create a new remote vendor" do
  #     response = @vendor.save
  #     response.should be_kind_of Net::HTTPSuccess
  #   end
  # end
end