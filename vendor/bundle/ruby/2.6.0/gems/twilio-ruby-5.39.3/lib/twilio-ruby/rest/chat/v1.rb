##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Chat
      class V1 < Version
        ##
        # Initialize the V1 version of Chat
        def initialize(domain)
          super
          @version = 'v1'
          @credentials = nil
          @services = nil
        end

        ##
        # @param [String] sid The Twilio-provided string that uniquely identifies the
        #   Credential resource to fetch.
        # @return [Twilio::REST::Chat::V1::CredentialContext] if sid was passed.
        # @return [Twilio::REST::Chat::V1::CredentialList]
        def credentials(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @credentials ||= CredentialList.new self
          else
            CredentialContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The Twilio-provided string that uniquely identifies the
        #   Service resource to fetch.
        # @return [Twilio::REST::Chat::V1::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Chat::V1::ServiceList]
        def services(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @services ||= ServiceList.new self
          else
            ServiceContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Chat::V1>'
        end
      end
    end
  end
end