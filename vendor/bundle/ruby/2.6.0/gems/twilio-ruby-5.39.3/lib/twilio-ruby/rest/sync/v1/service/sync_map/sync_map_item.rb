##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Sync < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class SyncMapContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SyncMapItemList < ListResource
              ##
              # Initialize the SyncMapItemList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the [Sync
              #   Service](https://www.twilio.com/docs/sync/api/service) the resource is
              #   associated with.
              # @param [String] map_sid The SID of the Sync Map that contains the Map Item.
              # @return [SyncMapItemList] SyncMapItemList
              def initialize(version, service_sid: nil, map_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, map_sid: map_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Maps/#{@solution[:map_sid]}/Items"
              end

              ##
              # Create the SyncMapItemInstance
              # @param [String] key The unique, user-defined key for the Map Item. Can be up to
              #   320 characters long.
              # @param [Hash] data A JSON string that represents an arbitrary, schema-less
              #   object that the Map Item stores. Can be up to 16KB in length.
              # @param [String] ttl An alias for `item_ttl`. If both parameters are provided,
              #   this value is ignored.
              # @param [String] item_ttl How long, in seconds, before the Map Item expires
              #   (time-to-live) and is deleted.  Can be an integer from 0 to 31,536,000 (1 year).
              #   The default value is `0`, which means the Map Item does not expire.  The Map
              #   Item will be deleted automatically after it expires, but there can be a delay
              #   between the expiration time and the resources's deletion.
              # @param [String] collection_ttl How long, in seconds, before the Map Item's
              #   parent Sync Map expires (time-to-live) and is deleted.  Can be an integer from 0
              #   to 31,536,000 (1 year). The default value is `0`, which means the parent Sync
              #   Map does not expire. The Sync Map will be deleted automatically after it
              #   expires, but there can be a delay between the expiration time and the
              #   resources's deletion.
              # @return [SyncMapItemInstance] Created SyncMapItemInstance
              def create(key: nil, data: nil, ttl: :unset, item_ttl: :unset, collection_ttl: :unset)
                data = Twilio::Values.of({
                    'Key' => key,
                    'Data' => Twilio.serialize_object(data),
                    'Ttl' => ttl,
                    'ItemTtl' => item_ttl,
                    'CollectionTtl' => collection_ttl,
                })

                payload = @version.create('POST', @uri, data: data)

                SyncMapItemInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    map_sid: @solution[:map_sid],
                )
              end

              ##
              # Lists SyncMapItemInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [sync_map_item.QueryResultOrder] order How to order the Map Items
              #   returned by their `key` value. Can be: `asc` (ascending) or `desc` (descending)
              #   and the default is ascending. Map Items are [ordered
              #   lexicographically](https://en.wikipedia.org/wiki/Lexicographical_order) by Item
              #   key.
              # @param [String] from The `key` of the first Sync Map Item resource to read. See
              #   also `bounds`.
              # @param [sync_map_item.QueryFromBoundType] bounds Whether to include the Map Item
              #   referenced by the `from` parameter. Can be: `inclusive` to include the Map Item
              #   referenced by the `from` parameter or `exclusive` to start with the next Map
              #   Item. The default value is `inclusive`.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(order: :unset, from: :unset, bounds: :unset, limit: nil, page_size: nil)
                self.stream(order: order, from: from, bounds: bounds, limit: limit, page_size: page_size).entries
              end

              ##
              # Streams SyncMapItemInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [sync_map_item.QueryResultOrder] order How to order the Map Items
              #   returned by their `key` value. Can be: `asc` (ascending) or `desc` (descending)
              #   and the default is ascending. Map Items are [ordered
              #   lexicographically](https://en.wikipedia.org/wiki/Lexicographical_order) by Item
              #   key.
              # @param [String] from The `key` of the first Sync Map Item resource to read. See
              #   also `bounds`.
              # @param [sync_map_item.QueryFromBoundType] bounds Whether to include the Map Item
              #   referenced by the `from` parameter. Can be: `inclusive` to include the Map Item
              #   referenced by the `from` parameter or `exclusive` to start with the next Map
              #   Item. The default value is `inclusive`.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(order: :unset, from: :unset, bounds: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(order: order, from: from, bounds: bounds, page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields SyncMapItemInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of SyncMapItemInstance records from the API.
              # Request is executed immediately.
              # @param [sync_map_item.QueryResultOrder] order How to order the Map Items
              #   returned by their `key` value. Can be: `asc` (ascending) or `desc` (descending)
              #   and the default is ascending. Map Items are [ordered
              #   lexicographically](https://en.wikipedia.org/wiki/Lexicographical_order) by Item
              #   key.
              # @param [String] from The `key` of the first Sync Map Item resource to read. See
              #   also `bounds`.
              # @param [sync_map_item.QueryFromBoundType] bounds Whether to include the Map Item
              #   referenced by the `from` parameter. Can be: `inclusive` to include the Map Item
              #   referenced by the `from` parameter or `exclusive` to start with the next Map
              #   Item. The default value is `inclusive`.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of SyncMapItemInstance
              def page(order: :unset, from: :unset, bounds: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Order' => order,
                    'From' => from,
                    'Bounds' => bounds,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })

                response = @version.page('GET', @uri, params: params)

                SyncMapItemPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of SyncMapItemInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of SyncMapItemInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                SyncMapItemPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Sync.V1.SyncMapItemList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SyncMapItemPage < Page
              ##
              # Initialize the SyncMapItemPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [SyncMapItemPage] SyncMapItemPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of SyncMapItemInstance
              # @param [Hash] payload Payload response from the API
              # @return [SyncMapItemInstance] SyncMapItemInstance
              def get_instance(payload)
                SyncMapItemInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    map_sid: @solution[:map_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Sync.V1.SyncMapItemPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SyncMapItemContext < InstanceContext
              ##
              # Initialize the SyncMapItemContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The SID of the [Sync
              #   Service](https://www.twilio.com/docs/sync/api/service) with the Sync Map Item
              #   resource to fetch.
              # @param [String] map_sid The SID of the Sync Map with the Sync Map Item resource
              #   to fetch. Can be the Sync Map's `sid` or its `unique_name`.
              # @param [String] key The `key` value of the Sync Map Item resource to fetch.
              # @return [SyncMapItemContext] SyncMapItemContext
              def initialize(version, service_sid, map_sid, key)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, map_sid: map_sid, key: key, }
                @uri = "/Services/#{@solution[:service_sid]}/Maps/#{@solution[:map_sid]}/Items/#{@solution[:key]}"
              end

              ##
              # Fetch the SyncMapItemInstance
              # @return [SyncMapItemInstance] Fetched SyncMapItemInstance
              def fetch
                payload = @version.fetch('GET', @uri)

                SyncMapItemInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    map_sid: @solution[:map_sid],
                    key: @solution[:key],
                )
              end

              ##
              # Delete the SyncMapItemInstance
              # @param [String] if_match The If-Match HTTP request header
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete(if_match: :unset)
                headers = Twilio::Values.of({'If-Match' => if_match, })

                 @version.delete('DELETE', @uri, headers: headers)
              end

              ##
              # Update the SyncMapItemInstance
              # @param [Hash] data A JSON string that represents an arbitrary, schema-less
              #   object that the Map Item stores. Can be up to 16KB in length.
              # @param [String] ttl An alias for `item_ttl`. If both parameters are provided,
              #   this value is ignored.
              # @param [String] item_ttl How long, in seconds, before the Map Item expires
              #   (time-to-live) and is deleted.  Can be an integer from 0 to 31,536,000 (1 year).
              #   The default value is `0`, which means the Map Item does not expire. The Map Item
              #   will be deleted automatically after it expires, but there can be a delay between
              #   the expiration time and the resources's deletion.
              # @param [String] collection_ttl How long, in seconds, before the Map Item's
              #   parent Sync Map expires (time-to-live) and is deleted.  Can be an integer from 0
              #   to 31,536,000 (1 year). The default value is `0`, which means the parent Sync
              #   Map does not expire. This parameter can only be used when the Map Item's `data`
              #   or `ttl` is updated in the same request. The Sync Map will be deleted
              #   automatically after it expires, but there can be a delay between the expiration
              #   time and the resources's deletion.
              # @param [String] if_match The If-Match HTTP request header
              # @return [SyncMapItemInstance] Updated SyncMapItemInstance
              def update(data: :unset, ttl: :unset, item_ttl: :unset, collection_ttl: :unset, if_match: :unset)
                data = Twilio::Values.of({
                    'Data' => Twilio.serialize_object(data),
                    'Ttl' => ttl,
                    'ItemTtl' => item_ttl,
                    'CollectionTtl' => collection_ttl,
                })
                headers = Twilio::Values.of({'If-Match' => if_match, })

                payload = @version.update('POST', @uri, data: data, headers: headers)

                SyncMapItemInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    map_sid: @solution[:map_sid],
                    key: @solution[:key],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Sync.V1.SyncMapItemContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Sync.V1.SyncMapItemContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SyncMapItemInstance < InstanceResource
              ##
              # Initialize the SyncMapItemInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The SID of the [Sync
              #   Service](https://www.twilio.com/docs/sync/api/service) the resource is
              #   associated with.
              # @param [String] map_sid The SID of the Sync Map that contains the Map Item.
              # @param [String] key The `key` value of the Sync Map Item resource to fetch.
              # @return [SyncMapItemInstance] SyncMapItemInstance
              def initialize(version, payload, service_sid: nil, map_sid: nil, key: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'key' => payload['key'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'map_sid' => payload['map_sid'],
                    'url' => payload['url'],
                    'revision' => payload['revision'],
                    'data' => payload['data'],
                    'date_expires' => Twilio.deserialize_iso8601_datetime(payload['date_expires']),
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'created_by' => payload['created_by'],
                }

                # Context
                @instance_context = nil
                @params = {'service_sid' => service_sid, 'map_sid' => map_sid, 'key' => key || @properties['key'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [SyncMapItemContext] SyncMapItemContext for this SyncMapItemInstance
              def context
                unless @instance_context
                  @instance_context = SyncMapItemContext.new(
                      @version,
                      @params['service_sid'],
                      @params['map_sid'],
                      @params['key'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique, user-defined key for the Map Item
              def key
                @properties['key']
              end

              ##
              # @return [String] The SID of the Account that created the resource
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The SID of the Sync Service that the resource is associated with
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The SID of the Sync Map that contains the Map Item
              def map_sid
                @properties['map_sid']
              end

              ##
              # @return [String] The absolute URL of the Map Item resource
              def url
                @properties['url']
              end

              ##
              # @return [String] The current revision of the Map Item, represented as a string
              def revision
                @properties['revision']
              end

              ##
              # @return [Hash] An arbitrary, schema-less object that the Map Item stores
              def data
                @properties['data']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the Map Item expires
              def date_expires
                @properties['date_expires']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The ISO 8601 date and time in GMT when the resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] The identity of the Map Item's creator
              def created_by
                @properties['created_by']
              end

              ##
              # Fetch the SyncMapItemInstance
              # @return [SyncMapItemInstance] Fetched SyncMapItemInstance
              def fetch
                context.fetch
              end

              ##
              # Delete the SyncMapItemInstance
              # @param [String] if_match The If-Match HTTP request header
              # @return [Boolean] true if delete succeeds, false otherwise
              def delete(if_match: :unset)
                context.delete(if_match: if_match, )
              end

              ##
              # Update the SyncMapItemInstance
              # @param [Hash] data A JSON string that represents an arbitrary, schema-less
              #   object that the Map Item stores. Can be up to 16KB in length.
              # @param [String] ttl An alias for `item_ttl`. If both parameters are provided,
              #   this value is ignored.
              # @param [String] item_ttl How long, in seconds, before the Map Item expires
              #   (time-to-live) and is deleted.  Can be an integer from 0 to 31,536,000 (1 year).
              #   The default value is `0`, which means the Map Item does not expire. The Map Item
              #   will be deleted automatically after it expires, but there can be a delay between
              #   the expiration time and the resources's deletion.
              # @param [String] collection_ttl How long, in seconds, before the Map Item's
              #   parent Sync Map expires (time-to-live) and is deleted.  Can be an integer from 0
              #   to 31,536,000 (1 year). The default value is `0`, which means the parent Sync
              #   Map does not expire. This parameter can only be used when the Map Item's `data`
              #   or `ttl` is updated in the same request. The Sync Map will be deleted
              #   automatically after it expires, but there can be a delay between the expiration
              #   time and the resources's deletion.
              # @param [String] if_match The If-Match HTTP request header
              # @return [SyncMapItemInstance] Updated SyncMapItemInstance
              def update(data: :unset, ttl: :unset, item_ttl: :unset, collection_ttl: :unset, if_match: :unset)
                context.update(
                    data: data,
                    ttl: ttl,
                    item_ttl: item_ttl,
                    collection_ttl: collection_ttl,
                    if_match: if_match,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Sync.V1.SyncMapItemInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Sync.V1.SyncMapItemInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end