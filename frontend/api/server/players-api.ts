/* tslint:disable */
/* eslint-disable */
/**
 * API V1
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: v1
 *
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import type { Configuration } from "../configuration";
import type { AxiosPromise, AxiosInstance, RawAxiosRequestConfig } from "axios";
import globalAxios from "axios";
// Some imports not used depending on template conditions
// @ts-ignore
import {
  DUMMY_BASE_URL,
  assertParamExists,
  setApiKeyToObject,
  setBasicAuthToObject,
  setBearerAuthToObject,
  setOAuthToObject,
  setSearchParams,
  serializeDataIfNeeded,
  toPathString,
  createRequestFunction,
} from "../common";
// @ts-ignore
import {
  BASE_PATH,
  COLLECTION_FORMATS,
  type RequestArgs,
  BaseAPI,
  RequiredError,
  operationServerMap,
} from "../base";
// @ts-ignore
import type { Player } from "../model";
// @ts-ignore
import type { PlayerDetails } from "../model";
// @ts-ignore
import type { PlayerRequest } from "../model";
/**
 * PlayersApi - axios parameter creator
 * @export
 */
export const PlayersApiAxiosParamCreator = function (
  configuration?: Configuration,
) {
  return {
    /**
     * Deletes a Player.
     * @summary Delete Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {number} id ID of the Player
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    deleteTournamentPlayer: async (
      tournamentId: number,
      id: number,
      options: RawAxiosRequestConfig = {},
    ): Promise<RequestArgs> => {
      // verify required parameter 'tournamentId' is not null or undefined
      assertParamExists("deleteTournamentPlayer", "tournamentId", tournamentId);
      // verify required parameter 'id' is not null or undefined
      assertParamExists("deleteTournamentPlayer", "id", id);
      const localVarPath = `/api/v1/tournaments/{tournament_id}/players/{id}`
        .replace(
          `{${"tournament_id"}}`,
          encodeURIComponent(String(tournamentId)),
        )
        .replace(`{${"id"}}`, encodeURIComponent(String(id)));
      // use dummy base URL string because the URL constructor only accepts absolute URLs.
      const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
      let baseOptions;
      if (configuration) {
        baseOptions = configuration.baseOptions;
      }

      const localVarRequestOptions = {
        method: "DELETE",
        ...baseOptions,
        ...options,
      };
      const localVarHeaderParameter = {} as any;
      const localVarQueryParameter = {} as any;

      setSearchParams(localVarUrlObj, localVarQueryParameter);
      let headersFromBaseOptions = baseOptions?.headers ?? {};
      localVarRequestOptions.headers = {
        ...localVarHeaderParameter,
        ...headersFromBaseOptions,
        ...options.headers,
      };

      return {
        url: toPathString(localVarUrlObj),
        options: localVarRequestOptions,
      };
    },
    /**
     * Retrieves a list of all Players
     * @summary List Tournament Players
     * @param {number} tournamentId ID of the Tournament
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    listPlayers: async (
      tournamentId: number,
      options: RawAxiosRequestConfig = {},
    ): Promise<RequestArgs> => {
      // verify required parameter 'tournamentId' is not null or undefined
      assertParamExists("listPlayers", "tournamentId", tournamentId);
      const localVarPath =
        `/api/v1/tournaments/{tournament_id}/players`.replace(
          `{${"tournament_id"}}`,
          encodeURIComponent(String(tournamentId)),
        );
      // use dummy base URL string because the URL constructor only accepts absolute URLs.
      const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
      let baseOptions;
      if (configuration) {
        baseOptions = configuration.baseOptions;
      }

      const localVarRequestOptions = {
        method: "GET",
        ...baseOptions,
        ...options,
      };
      const localVarHeaderParameter = {} as any;
      const localVarQueryParameter = {} as any;

      setSearchParams(localVarUrlObj, localVarQueryParameter);
      let headersFromBaseOptions = baseOptions?.headers ?? {};
      localVarRequestOptions.headers = {
        ...localVarHeaderParameter,
        ...headersFromBaseOptions,
        ...options.headers,
      };

      return {
        url: toPathString(localVarUrlObj),
        options: localVarRequestOptions,
      };
    },
    /**
     * Creates a new Player.
     * @summary Create Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {PlayerRequest} [playerRequest]
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    postTournamentPlayer: async (
      tournamentId: number,
      playerRequest?: PlayerRequest,
      options: RawAxiosRequestConfig = {},
    ): Promise<RequestArgs> => {
      // verify required parameter 'tournamentId' is not null or undefined
      assertParamExists("postTournamentPlayer", "tournamentId", tournamentId);
      const localVarPath =
        `/api/v1/tournaments/{tournament_id}/players`.replace(
          `{${"tournament_id"}}`,
          encodeURIComponent(String(tournamentId)),
        );
      // use dummy base URL string because the URL constructor only accepts absolute URLs.
      const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
      let baseOptions;
      if (configuration) {
        baseOptions = configuration.baseOptions;
      }

      const localVarRequestOptions = {
        method: "POST",
        ...baseOptions,
        ...options,
      };
      const localVarHeaderParameter = {} as any;
      const localVarQueryParameter = {} as any;

      localVarHeaderParameter["Content-Type"] = "application/json";

      setSearchParams(localVarUrlObj, localVarQueryParameter);
      let headersFromBaseOptions = baseOptions?.headers ?? {};
      localVarRequestOptions.headers = {
        ...localVarHeaderParameter,
        ...headersFromBaseOptions,
        ...options.headers,
      };
      localVarRequestOptions.data = serializeDataIfNeeded(
        playerRequest,
        localVarRequestOptions,
        configuration,
      );

      return {
        url: toPathString(localVarUrlObj),
        options: localVarRequestOptions,
      };
    },
    /**
     * Updates a Player.
     * @summary Update Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {number} id ID of the Player
     * @param {PlayerRequest} [playerRequest]
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    putTournamentPlayer: async (
      tournamentId: number,
      id: number,
      playerRequest?: PlayerRequest,
      options: RawAxiosRequestConfig = {},
    ): Promise<RequestArgs> => {
      // verify required parameter 'tournamentId' is not null or undefined
      assertParamExists("putTournamentPlayer", "tournamentId", tournamentId);
      // verify required parameter 'id' is not null or undefined
      assertParamExists("putTournamentPlayer", "id", id);
      const localVarPath = `/api/v1/tournaments/{tournament_id}/players/{id}`
        .replace(
          `{${"tournament_id"}}`,
          encodeURIComponent(String(tournamentId)),
        )
        .replace(`{${"id"}}`, encodeURIComponent(String(id)));
      // use dummy base URL string because the URL constructor only accepts absolute URLs.
      const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
      let baseOptions;
      if (configuration) {
        baseOptions = configuration.baseOptions;
      }

      const localVarRequestOptions = {
        method: "PATCH",
        ...baseOptions,
        ...options,
      };
      const localVarHeaderParameter = {} as any;
      const localVarQueryParameter = {} as any;

      localVarHeaderParameter["Content-Type"] = "application/json";

      setSearchParams(localVarUrlObj, localVarQueryParameter);
      let headersFromBaseOptions = baseOptions?.headers ?? {};
      localVarRequestOptions.headers = {
        ...localVarHeaderParameter,
        ...headersFromBaseOptions,
        ...options.headers,
      };
      localVarRequestOptions.data = serializeDataIfNeeded(
        playerRequest,
        localVarRequestOptions,
        configuration,
      );

      return {
        url: toPathString(localVarUrlObj),
        options: localVarRequestOptions,
      };
    },
    /**
     * Retrieves a Player
     * @summary Show Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {number} id ID of the Player
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    showTournamentPlayer: async (
      tournamentId: number,
      id: number,
      options: RawAxiosRequestConfig = {},
    ): Promise<RequestArgs> => {
      // verify required parameter 'tournamentId' is not null or undefined
      assertParamExists("showTournamentPlayer", "tournamentId", tournamentId);
      // verify required parameter 'id' is not null or undefined
      assertParamExists("showTournamentPlayer", "id", id);
      const localVarPath = `/api/v1/tournaments/{tournament_id}/players/{id}`
        .replace(
          `{${"tournament_id"}}`,
          encodeURIComponent(String(tournamentId)),
        )
        .replace(`{${"id"}}`, encodeURIComponent(String(id)));
      // use dummy base URL string because the URL constructor only accepts absolute URLs.
      const localVarUrlObj = new URL(localVarPath, DUMMY_BASE_URL);
      let baseOptions;
      if (configuration) {
        baseOptions = configuration.baseOptions;
      }

      const localVarRequestOptions = {
        method: "GET",
        ...baseOptions,
        ...options,
      };
      const localVarHeaderParameter = {} as any;
      const localVarQueryParameter = {} as any;

      setSearchParams(localVarUrlObj, localVarQueryParameter);
      let headersFromBaseOptions = baseOptions?.headers ?? {};
      localVarRequestOptions.headers = {
        ...localVarHeaderParameter,
        ...headersFromBaseOptions,
        ...options.headers,
      };

      return {
        url: toPathString(localVarUrlObj),
        options: localVarRequestOptions,
      };
    },
  };
};

/**
 * PlayersApi - functional programming interface
 * @export
 */
export const PlayersApiFp = function (configuration?: Configuration) {
  const localVarAxiosParamCreator = PlayersApiAxiosParamCreator(configuration);
  return {
    /**
     * Deletes a Player.
     * @summary Delete Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {number} id ID of the Player
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    async deleteTournamentPlayer(
      tournamentId: number,
      id: number,
      options?: RawAxiosRequestConfig,
    ): Promise<
      (axios?: AxiosInstance, basePath?: string) => AxiosPromise<void>
    > {
      const localVarAxiosArgs =
        await localVarAxiosParamCreator.deleteTournamentPlayer(
          tournamentId,
          id,
          options,
        );
      const localVarOperationServerIndex = configuration?.serverIndex ?? 0;
      const localVarOperationServerBasePath =
        operationServerMap["PlayersApi.deleteTournamentPlayer"]?.[
          localVarOperationServerIndex
        ]?.url;
      return (axios, basePath) =>
        createRequestFunction(
          localVarAxiosArgs,
          globalAxios,
          BASE_PATH,
          configuration,
        )(axios, localVarOperationServerBasePath || basePath);
    },
    /**
     * Retrieves a list of all Players
     * @summary List Tournament Players
     * @param {number} tournamentId ID of the Tournament
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    async listPlayers(
      tournamentId: number,
      options?: RawAxiosRequestConfig,
    ): Promise<
      (axios?: AxiosInstance, basePath?: string) => AxiosPromise<Array<Player>>
    > {
      const localVarAxiosArgs = await localVarAxiosParamCreator.listPlayers(
        tournamentId,
        options,
      );
      const localVarOperationServerIndex = configuration?.serverIndex ?? 0;
      const localVarOperationServerBasePath =
        operationServerMap["PlayersApi.listPlayers"]?.[
          localVarOperationServerIndex
        ]?.url;
      return (axios, basePath) =>
        createRequestFunction(
          localVarAxiosArgs,
          globalAxios,
          BASE_PATH,
          configuration,
        )(axios, localVarOperationServerBasePath || basePath);
    },
    /**
     * Creates a new Player.
     * @summary Create Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {PlayerRequest} [playerRequest]
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    async postTournamentPlayer(
      tournamentId: number,
      playerRequest?: PlayerRequest,
      options?: RawAxiosRequestConfig,
    ): Promise<
      (axios?: AxiosInstance, basePath?: string) => AxiosPromise<PlayerDetails>
    > {
      const localVarAxiosArgs =
        await localVarAxiosParamCreator.postTournamentPlayer(
          tournamentId,
          playerRequest,
          options,
        );
      const localVarOperationServerIndex = configuration?.serverIndex ?? 0;
      const localVarOperationServerBasePath =
        operationServerMap["PlayersApi.postTournamentPlayer"]?.[
          localVarOperationServerIndex
        ]?.url;
      return (axios, basePath) =>
        createRequestFunction(
          localVarAxiosArgs,
          globalAxios,
          BASE_PATH,
          configuration,
        )(axios, localVarOperationServerBasePath || basePath);
    },
    /**
     * Updates a Player.
     * @summary Update Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {number} id ID of the Player
     * @param {PlayerRequest} [playerRequest]
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    async putTournamentPlayer(
      tournamentId: number,
      id: number,
      playerRequest?: PlayerRequest,
      options?: RawAxiosRequestConfig,
    ): Promise<
      (axios?: AxiosInstance, basePath?: string) => AxiosPromise<PlayerDetails>
    > {
      const localVarAxiosArgs =
        await localVarAxiosParamCreator.putTournamentPlayer(
          tournamentId,
          id,
          playerRequest,
          options,
        );
      const localVarOperationServerIndex = configuration?.serverIndex ?? 0;
      const localVarOperationServerBasePath =
        operationServerMap["PlayersApi.putTournamentPlayer"]?.[
          localVarOperationServerIndex
        ]?.url;
      return (axios, basePath) =>
        createRequestFunction(
          localVarAxiosArgs,
          globalAxios,
          BASE_PATH,
          configuration,
        )(axios, localVarOperationServerBasePath || basePath);
    },
    /**
     * Retrieves a Player
     * @summary Show Tournament Player
     * @param {number} tournamentId ID of the Tournament
     * @param {number} id ID of the Player
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    async showTournamentPlayer(
      tournamentId: number,
      id: number,
      options?: RawAxiosRequestConfig,
    ): Promise<
      (axios?: AxiosInstance, basePath?: string) => AxiosPromise<PlayerDetails>
    > {
      const localVarAxiosArgs =
        await localVarAxiosParamCreator.showTournamentPlayer(
          tournamentId,
          id,
          options,
        );
      const localVarOperationServerIndex = configuration?.serverIndex ?? 0;
      const localVarOperationServerBasePath =
        operationServerMap["PlayersApi.showTournamentPlayer"]?.[
          localVarOperationServerIndex
        ]?.url;
      return (axios, basePath) =>
        createRequestFunction(
          localVarAxiosArgs,
          globalAxios,
          BASE_PATH,
          configuration,
        )(axios, localVarOperationServerBasePath || basePath);
    },
  };
};

/**
 * PlayersApi - factory interface
 * @export
 */
export const PlayersApiFactory = function (
  configuration?: Configuration,
  basePath?: string,
  axios?: AxiosInstance,
) {
  const localVarFp = PlayersApiFp(configuration);
  return {
    /**
     * Deletes a Player.
     * @summary Delete Tournament Player
     * @param {PlayersApiDeleteTournamentPlayerRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    deleteTournamentPlayer(
      requestParameters: PlayersApiDeleteTournamentPlayerRequest,
      options?: RawAxiosRequestConfig,
    ): AxiosPromise<void> {
      return localVarFp
        .deleteTournamentPlayer(
          requestParameters.tournamentId,
          requestParameters.id,
          options,
        )
        .then((request) => request(axios, basePath));
    },
    /**
     * Retrieves a list of all Players
     * @summary List Tournament Players
     * @param {PlayersApiListPlayersRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    listPlayers(
      requestParameters: PlayersApiListPlayersRequest,
      options?: RawAxiosRequestConfig,
    ): AxiosPromise<Array<Player>> {
      return localVarFp
        .listPlayers(requestParameters.tournamentId, options)
        .then((request) => request(axios, basePath));
    },
    /**
     * Creates a new Player.
     * @summary Create Tournament Player
     * @param {PlayersApiPostTournamentPlayerRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    postTournamentPlayer(
      requestParameters: PlayersApiPostTournamentPlayerRequest,
      options?: RawAxiosRequestConfig,
    ): AxiosPromise<PlayerDetails> {
      return localVarFp
        .postTournamentPlayer(
          requestParameters.tournamentId,
          requestParameters.playerRequest,
          options,
        )
        .then((request) => request(axios, basePath));
    },
    /**
     * Updates a Player.
     * @summary Update Tournament Player
     * @param {PlayersApiPutTournamentPlayerRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    putTournamentPlayer(
      requestParameters: PlayersApiPutTournamentPlayerRequest,
      options?: RawAxiosRequestConfig,
    ): AxiosPromise<PlayerDetails> {
      return localVarFp
        .putTournamentPlayer(
          requestParameters.tournamentId,
          requestParameters.id,
          requestParameters.playerRequest,
          options,
        )
        .then((request) => request(axios, basePath));
    },
    /**
     * Retrieves a Player
     * @summary Show Tournament Player
     * @param {PlayersApiShowTournamentPlayerRequest} requestParameters Request parameters.
     * @param {*} [options] Override http request option.
     * @throws {RequiredError}
     */
    showTournamentPlayer(
      requestParameters: PlayersApiShowTournamentPlayerRequest,
      options?: RawAxiosRequestConfig,
    ): AxiosPromise<PlayerDetails> {
      return localVarFp
        .showTournamentPlayer(
          requestParameters.tournamentId,
          requestParameters.id,
          options,
        )
        .then((request) => request(axios, basePath));
    },
  };
};

/**
 * Request parameters for deleteTournamentPlayer operation in PlayersApi.
 * @export
 * @interface PlayersApiDeleteTournamentPlayerRequest
 */
export interface PlayersApiDeleteTournamentPlayerRequest {
  /**
   * ID of the Tournament
   * @type {number}
   * @memberof PlayersApiDeleteTournamentPlayer
   */
  readonly tournamentId: number;

  /**
   * ID of the Player
   * @type {number}
   * @memberof PlayersApiDeleteTournamentPlayer
   */
  readonly id: number;
}

/**
 * Request parameters for listPlayers operation in PlayersApi.
 * @export
 * @interface PlayersApiListPlayersRequest
 */
export interface PlayersApiListPlayersRequest {
  /**
   * ID of the Tournament
   * @type {number}
   * @memberof PlayersApiListPlayers
   */
  readonly tournamentId: number;
}

/**
 * Request parameters for postTournamentPlayer operation in PlayersApi.
 * @export
 * @interface PlayersApiPostTournamentPlayerRequest
 */
export interface PlayersApiPostTournamentPlayerRequest {
  /**
   * ID of the Tournament
   * @type {number}
   * @memberof PlayersApiPostTournamentPlayer
   */
  readonly tournamentId: number;

  /**
   *
   * @type {PlayerRequest}
   * @memberof PlayersApiPostTournamentPlayer
   */
  readonly playerRequest?: PlayerRequest;
}

/**
 * Request parameters for putTournamentPlayer operation in PlayersApi.
 * @export
 * @interface PlayersApiPutTournamentPlayerRequest
 */
export interface PlayersApiPutTournamentPlayerRequest {
  /**
   * ID of the Tournament
   * @type {number}
   * @memberof PlayersApiPutTournamentPlayer
   */
  readonly tournamentId: number;

  /**
   * ID of the Player
   * @type {number}
   * @memberof PlayersApiPutTournamentPlayer
   */
  readonly id: number;

  /**
   *
   * @type {PlayerRequest}
   * @memberof PlayersApiPutTournamentPlayer
   */
  readonly playerRequest?: PlayerRequest;
}

/**
 * Request parameters for showTournamentPlayer operation in PlayersApi.
 * @export
 * @interface PlayersApiShowTournamentPlayerRequest
 */
export interface PlayersApiShowTournamentPlayerRequest {
  /**
   * ID of the Tournament
   * @type {number}
   * @memberof PlayersApiShowTournamentPlayer
   */
  readonly tournamentId: number;

  /**
   * ID of the Player
   * @type {number}
   * @memberof PlayersApiShowTournamentPlayer
   */
  readonly id: number;
}

/**
 * PlayersApi - object-oriented interface
 * @export
 * @class PlayersApi
 * @extends {BaseAPI}
 */
export class PlayersApi extends BaseAPI {
  /**
   * Deletes a Player.
   * @summary Delete Tournament Player
   * @param {PlayersApiDeleteTournamentPlayerRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlayersApi
   */
  public deleteTournamentPlayer(
    requestParameters: PlayersApiDeleteTournamentPlayerRequest,
    options?: RawAxiosRequestConfig,
  ) {
    return PlayersApiFp(this.configuration)
      .deleteTournamentPlayer(
        requestParameters.tournamentId,
        requestParameters.id,
        options,
      )
      .then((request) => request(this.axios, this.basePath));
  }

  /**
   * Retrieves a list of all Players
   * @summary List Tournament Players
   * @param {PlayersApiListPlayersRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlayersApi
   */
  public listPlayers(
    requestParameters: PlayersApiListPlayersRequest,
    options?: RawAxiosRequestConfig,
  ) {
    return PlayersApiFp(this.configuration)
      .listPlayers(requestParameters.tournamentId, options)
      .then((request) => request(this.axios, this.basePath));
  }

  /**
   * Creates a new Player.
   * @summary Create Tournament Player
   * @param {PlayersApiPostTournamentPlayerRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlayersApi
   */
  public postTournamentPlayer(
    requestParameters: PlayersApiPostTournamentPlayerRequest,
    options?: RawAxiosRequestConfig,
  ) {
    return PlayersApiFp(this.configuration)
      .postTournamentPlayer(
        requestParameters.tournamentId,
        requestParameters.playerRequest,
        options,
      )
      .then((request) => request(this.axios, this.basePath));
  }

  /**
   * Updates a Player.
   * @summary Update Tournament Player
   * @param {PlayersApiPutTournamentPlayerRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlayersApi
   */
  public putTournamentPlayer(
    requestParameters: PlayersApiPutTournamentPlayerRequest,
    options?: RawAxiosRequestConfig,
  ) {
    return PlayersApiFp(this.configuration)
      .putTournamentPlayer(
        requestParameters.tournamentId,
        requestParameters.id,
        requestParameters.playerRequest,
        options,
      )
      .then((request) => request(this.axios, this.basePath));
  }

  /**
   * Retrieves a Player
   * @summary Show Tournament Player
   * @param {PlayersApiShowTournamentPlayerRequest} requestParameters Request parameters.
   * @param {*} [options] Override http request option.
   * @throws {RequiredError}
   * @memberof PlayersApi
   */
  public showTournamentPlayer(
    requestParameters: PlayersApiShowTournamentPlayerRequest,
    options?: RawAxiosRequestConfig,
  ) {
    return PlayersApiFp(this.configuration)
      .showTournamentPlayer(
        requestParameters.tournamentId,
        requestParameters.id,
        options,
      )
      .then((request) => request(this.axios, this.basePath));
  }
}