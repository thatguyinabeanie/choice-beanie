# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `mutex_m` gem.
# Please instead update this file by running `bin/tapioca gem mutex_m`.


# = mutex_m.rb
#
# When 'mutex_m' is required, any object that extends or includes Mutex_m will
# be treated like a Mutex.
#
# Start by requiring the standard library Mutex_m:
#
#   require "mutex_m.rb"
#
# From here you can extend an object with Mutex instance methods:
#
#   obj = Object.new
#   obj.extend Mutex_m
#
# Or mixin Mutex_m into your module to your class inherit Mutex instance
# methods --- remember to call super() in your class initialize method.
#
#   class Foo
#     include Mutex_m
#     def initialize
#       # ...
#       super()
#     end
#     # ...
#   end
#   obj = Foo.new
#   # this obj can be handled like Mutex
module Mutex_m
  # source://mutex_m//mutex_m.rb#111
  def initialize(*args, **_arg1); end

  # source://mutex_m//mutex_m.rb#64
  def mu_extended; end

  # See Thread::Mutex#lock
  #
  # source://mutex_m//mutex_m.rb#91
  def mu_lock; end

  # See Thread::Mutex#locked?
  #
  # @return [Boolean]
  #
  # source://mutex_m//mutex_m.rb#81
  def mu_locked?; end

  # See Thread::Mutex#synchronize
  #
  # source://mutex_m//mutex_m.rb#76
  def mu_synchronize(&block); end

  # See Thread::Mutex#try_lock
  #
  # source://mutex_m//mutex_m.rb#86
  def mu_try_lock; end

  # See Thread::Mutex#unlock
  #
  # source://mutex_m//mutex_m.rb#96
  def mu_unlock; end

  # See Thread::Mutex#sleep
  #
  # source://mutex_m//mutex_m.rb#101
  def sleep(timeout = T.unsafe(nil)); end

  private

  # source://mutex_m//mutex_m.rb#107
  def mu_initialize; end

  class << self
    # source://mutex_m//mutex_m.rb#54
    def append_features(cl); end

    # source://mutex_m//mutex_m.rb#46
    def define_aliases(cl); end

    # source://mutex_m//mutex_m.rb#59
    def extend_object(obj); end
  end
end

# source://mutex_m//mutex_m.rb#43
Mutex_m::VERSION = T.let(T.unsafe(nil), String)
