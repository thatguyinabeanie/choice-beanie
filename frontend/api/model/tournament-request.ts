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

/**
 *
 * @export
 * @interface TournamentRequest
 */
export interface TournamentRequest {
  /**
   *
   * @type {number}
   * @memberof TournamentRequest
   */
  id?: number;
  /**
   *
   * @type {string}
   * @memberof TournamentRequest
   */
  name: string;
  /**
   *
   * @type {number}
   * @memberof TournamentRequest
   */
  game_id: number;
  /**
   *
   * @type {number}
   * @memberof TournamentRequest
   */
  format_id: number;
  /**
   *
   * @type {boolean}
   * @memberof TournamentRequest
   */
  autostart: boolean;
  /**
   *
   * @type {number}
   * @memberof TournamentRequest
   */
  player_cap: number | null;
  /**
   *
   * @type {string}
   * @memberof TournamentRequest
   */
  registration_start_at: string | null;
  /**
   *
   * @type {string}
   * @memberof TournamentRequest
   */
  registration_end_at: string | null;
  /**
   *
   * @type {boolean}
   * @memberof TournamentRequest
   */
  late_registration: boolean;
  /**
   *
   * @type {boolean}
   * @memberof TournamentRequest
   */
  late_check_in: boolean;
  /**
   *
   * @type {string}
   * @memberof TournamentRequest
   */
  check_in_start_at: string | null;
  /**
   *
   * @type {boolean}
   * @memberof TournamentRequest
   */
  open_team_sheets: boolean;
  /**
   *
   * @type {boolean}
   * @memberof TournamentRequest
   */
  teamlists_required: boolean;
}
