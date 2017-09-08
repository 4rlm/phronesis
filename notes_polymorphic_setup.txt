Description: Steps and Notes on Setting up Polymorphic Associations, Module via Concerns, Servicers Class.
Blog Example: http://www.xyzpub.com/en/ruby-on-rails/3.2/activerecord_polymorphic.html
======================================


======================================
0) RAILS NEW (app_name)
======================================

$ rails new phronesis
$ cd phronesis
======================================


======================================
1) SCAFFOLD
======================================

Account ----
  $ rails g scaffold Account status source

Address ----
  $ rails g scaffold Address street city zip state full_address address_pin
    t.references :address, index: true

  $ rails g scaffold Addressing
    t.references :address, index: true
    t.references :addressable, polymorphic: true, index: true

Contact ----
  $ rails g scaffold Contact status source first_name last_name email

Crm ----
  $ rails g scaffold Crm crm_id type source
    t.references :crm, index: true

  $ rails g scaffold Crming
    t.references :crm, index: true
    t.references :crmable, polymorphic: true, index: true

Org ----
  $ rails g scaffold Org name
    t.index :org, unique: true

  $ rails g scaffold Orging
    t.references :org, index: true
    t.references :orgable, polymorphic: true, index: true

Phone ----
  $ rails g scaffold Phone phone
    t.index :phone, unique: true

  $ rails g scaffold Phoning
    t.references :phone, index: true
    t.references :phonable, polymorphic: true, index: true

Url ----
  $ rails g scaffold Url url valid:boolean
    t.index :url, unique: true

  $ rails g scaffold Urling
    t.references :url, index: true
    t.references :urlable, polymorphic: true, index: true
----

$ rake db:migrate

    ========= Future =========
    $ rails g scaffold Bot status
    $ rails g scaffold Geo status
    $ rails g scaffold Who status

======================================


======================================
2) MODEL CLASSES
======================================

Account ----
  -class Account
    has_many :phonings, as: :phonable
    has_many :phones, through: :phonings

    has_many :urlings, as: :urlable
    has_many :urls, through: :urlings

    has_many :orgings, as: :orgable
    has_many :orgs, through: :orgings

    has_many :addressings, as: :addressable
    has_many :addresses, through: :addressings

    has_many :crmings, as: :crmable
    has_many :crms, through: :crmings

Address ----
  -class Address
    validates :address, uniqueness: true
    has_many :addressings
    has_many :accounts, through: :addressings, source: :addressable, source_type: :Account
    has_many :contacts, through: :addressings, source: :addressable, source_type: :Contact

  -class Addressing
    belongs_to :addressable, polymorphic: true
    belongs_to :address

Contact ----
  -class Contact
    has_many :phonings, as: :phonable
    has_many :phones, through: :phonings

    has_many :urlings, as: :urlable
    has_many :urls, through: :urlings

    has_many :orgings, as: :orgable
    has_many :orgs, through: :orgings

    has_many :addressings, as: :addressable
    has_many :addresses, through: :addressings

    has_many :crmings, as: :crmable
    has_many :crms, through: :crmings

Crm ----
  -class Crm
    validates :crm, uniqueness: true
    has_many :crmings
    has_many :accounts, through: :crmings, source: :crmable, source_type: :Account
    has_many :contacts, through: :crmings, source: :crmable, source_type: :Contact

  -class Crming
    belongs_to :crmable, polymorphic: true
    belongs_to :crm

Org ----
  -class Org
    validates :org, uniqueness: true
    has_many :orgings
    has_many :accounts, through: :orgings, source: :orgable, source_type: :Account
    has_many :contacts, through: :orgings, source: :orgable, source_type: :Contact

  -class Orging
    belongs_to :orgable, polymorphic: true
    belongs_to :org

Phone ----
  -class Phone
    validates :phone, uniqueness: true
    has_many :phonings
    has_many :accounts, through: :phonings, source: :phonable, source_type: :Account
    has_many :contacts, through: :phonings, source: :phonable, source_type: :Contact

  -class Phoning
    belongs_to :phonable, polymorphic: true
    belongs_to :phone

Url ----
  -class Url
    validates :url, uniqueness: true
    has_many :urlings
    has_many :accounts, through: :urlings, source: :urlable, source_type: :Account
    has_many :contacts, through: :urlings, source: :urlable, source_type: :Contact

  -class Urling
    belongs_to :urlable, polymorphic: true
    belongs_to :url
======================================


======================================
3) Add Sample Data (VIA RAILS CONSOLE)
======================================

$ rails c
# require 'hirb'
# Hirb.enable

========== Add Accounts & Phone:

>> account = Account.create(status: 'AccountScraper', source: 'CRM')
>> account.phones.find_or_create_by(phone: '(123) 456-7890')

>> account = Account.create(status: 'ContactScraper', source: 'Bot')
>> account.phones.find_or_create_by(phone: '(456) 789-0123')

========== Add Contacts & Phone:

>> contact = Contact.create(status: 'Imported', source: 'CRM', first_name: 'Bob', last_name: 'Miller')
>> contact.phones << Phone.find_or_create_by(phone: '(123) 456-7890')

>> contact = Contact.create(status: 'ContactScraper', source: 'Bot', first_name: 'Sally', last_name: 'Yates')
>> contact.phones << Phone.find_or_create_by(phone: '(456) 789-0123')

========== Find Account or Contact, then Add Phone:

>> contact = Contact.find_by(first_name: 'Sally')
>> contact.phones << Phone.find_or_create_by(phone: '(456) 789-0123')
======================================


======================================
4) View Data
======================================

Phone.all
Phoning.all
Account.all
Contact.all
Bob.phones
Phone.last.phonable
======================================


======================================
5) APPLICATION CONFIG
======================================

PATH: config/application.rb
config.autoload_paths << File.join(config.root, "lib")
config.autoload_paths += %W(#{config.root}/controllers/concerns)
# config.autoload_paths += %W(#{config.root}/lib/servicers)
config.autoload_paths << Rails.root.join('lib/servicers')
config.autoload_paths += Dir["#{config.root}/lib/servicers"]


======================================
6) CREATE MODULE
======================================

PATH: controllers/concerns/account_parser.rb
module AccountParser
  extend ActiveSupport::Concern

  def welcome
    puts "Welcome to AccountParser!"
  end

end
======================================


======================================
7) CREATE SERVICER CLASS
======================================

PATH: lib/servicers/sampler.rb
## Call: AccountSaver.new.start_account_saver
## Description: ........

class AccountSaver
  include AccountParser

  def initialize
    puts "\n\n== Welcome to the AccountSaver Class! ==\n\n"
  end

  def start_account_saver
    welcome
  end

end
======================================
