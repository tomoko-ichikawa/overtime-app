##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ValidationRequestList < ListResource
            ##
            # Initialize the ValidationRequestList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/iam/api/account) responsible for the
            #   Caller ID.
            # @return [ValidationRequestList] ValidationRequestList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/OutgoingCallerIds.json"
            end

            ##
            # Create the ValidationRequestInstance
            # @param [String] phone_number The phone number to verify in
            #   [E.164](https://www.twilio.com/docs/glossary/what-e164) format, which consists
            #   of a + followed by the country code and subscriber number.
            # @param [String] friendly_name A descriptive string that you create to describe
            #   the new caller ID resource. It can be up to 64 characters long. The default
            #   value is a formatted version of the phone number.
            # @param [String] call_delay The number of seconds to delay before initiating the
            #   verification call. Can be an integer between `0` and `60`, inclusive. The
            #   default is `0`.
            # @param [String] extension The digits to dial after connecting the verification
            #   call.
            # @param [String] status_callback The URL we should call using the
            #   `status_callback_method` to send status information about the verification
            #   process to your application.
            # @param [String] status_callback_method The HTTP method we should use to call
            #   `status_callback`. Can be: `GET` or `POST`, and the default is `POST`.
            # @return [ValidationRequestInstance] Created ValidationRequestInstance
            def create(phone_number: nil, friendly_name: :unset, call_delay: :unset, extension: :unset, status_callback: :unset, status_callback_method: :unset)
              data = Twilio::Values.of({
                  'PhoneNumber' => phone_number,
                  'FriendlyName' => friendly_name,
                  'CallDelay' => call_delay,
                  'Extension' => extension,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
              })

              payload = @version.create('POST', @uri, data: data)

              ValidationRequestInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.ValidationRequestList>'
            end
          end

          class ValidationRequestPage < Page
            ##
            # Initialize the ValidationRequestPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ValidationRequestPage] ValidationRequestPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ValidationRequestInstance
            # @param [Hash] payload Payload response from the API
            # @return [ValidationRequestInstance] ValidationRequestInstance
            def get_instance(payload)
              ValidationRequestInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.ValidationRequestPage>'
            end
          end

          class ValidationRequestInstance < InstanceResource
            ##
            # Initialize the ValidationRequestInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/iam/api/account) responsible for the
            #   Caller ID.
            # @return [ValidationRequestInstance] ValidationRequestInstance
            def initialize(version, payload, account_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'call_sid' => payload['call_sid'],
                  'friendly_name' => payload['friendly_name'],
                  'phone_number' => payload['phone_number'],
                  'validation_code' => payload['validation_code'],
              }
            end

            ##
            # @return [String] The SID of the Account that created the resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Call the resource is associated with
            def call_sid
              @properties['call_sid']
            end

            ##
            # @return [String] The string that you assigned to describe the resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The phone number to verify in E.164 format
            def phone_number
              @properties['phone_number']
            end

            ##
            # @return [String] The 6 digit validation code that someone must enter to validate the Caller ID  when `phone_number` is called
            def validation_code
              @properties['validation_code']
            end

            ##
            # Provide a user friendly representation
            def to_s
              "<Twilio.Api.V2010.ValidationRequestInstance>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              "<Twilio.Api.V2010.ValidationRequestInstance>"
            end
          end
        end
      end
    end
  end
end