// generated with @7nohe/openapi-react-query-codegen@1.4.1 

import { type QueryClient } from "@tanstack/react-query";
import { GamesService, OrganizationsService, PhasesService, PlayersService, TournamentsService, UsersService } from "../requests/services.gen";
import * as Common from "./common";
export const prefetchUseGamesServiceListGames = (queryClient: QueryClient) => queryClient.prefetchQuery({ queryKey: Common.UseGamesServiceListGamesKeyFn(), queryFn: () => GamesService.listGames() });
export const prefetchUseGamesServiceGetGame = (queryClient: QueryClient, { id }: {
  id: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseGamesServiceGetGameKeyFn({ id }), queryFn: () => GamesService.getGame({ id }) });
export const prefetchUseOrganizationsServiceListOrganizations = (queryClient: QueryClient) => queryClient.prefetchQuery({ queryKey: Common.UseOrganizationsServiceListOrganizationsKeyFn(), queryFn: () => OrganizationsService.listOrganizations() });
export const prefetchUseOrganizationsServiceGetOrganization = (queryClient: QueryClient, { id }: {
  id: string;
}) => queryClient.prefetchQuery({ queryKey: Common.UseOrganizationsServiceGetOrganizationKeyFn({ id }), queryFn: () => OrganizationsService.getOrganization({ id }) });
export const prefetchUseOrganizationsServiceGetOrganizationStaff = (queryClient: QueryClient, { id }: {
  id: string;
}) => queryClient.prefetchQuery({ queryKey: Common.UseOrganizationsServiceGetOrganizationStaffKeyFn({ id }), queryFn: () => OrganizationsService.getOrganizationStaff({ id }) });
export const prefetchUsePhasesServiceListTournamentPhases = (queryClient: QueryClient, { tournamentId }: {
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePhasesServiceListTournamentPhasesKeyFn({ tournamentId }), queryFn: () => PhasesService.listTournamentPhases({ tournamentId }) });
export const prefetchUsePhasesServiceShowTournamentPhase = (queryClient: QueryClient, { id, tournamentId }: {
  id: number;
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePhasesServiceShowTournamentPhaseKeyFn({ id, tournamentId }), queryFn: () => PhasesService.showTournamentPhase({ id, tournamentId }) });
export const prefetchUsePlayersServiceListPlayers = (queryClient: QueryClient, { tournamentId }: {
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePlayersServiceListPlayersKeyFn({ tournamentId }), queryFn: () => PlayersService.listPlayers({ tournamentId }) });
export const prefetchUsePlayersServiceShowTournamentPlayer = (queryClient: QueryClient, { id, tournamentId }: {
  id: number;
  tournamentId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UsePlayersServiceShowTournamentPlayerKeyFn({ id, tournamentId }), queryFn: () => PlayersService.showTournamentPlayer({ id, tournamentId }) });
export const prefetchUseTournamentsServiceListTournaments = (queryClient: QueryClient, { organizationId }: {
  organizationId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseTournamentsServiceListTournamentsKeyFn({ organizationId }), queryFn: () => TournamentsService.listTournaments({ organizationId }) });
export const prefetchUseTournamentsServiceGetTournament = (queryClient: QueryClient, { id, organizationId }: {
  id: number;
  organizationId: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseTournamentsServiceGetTournamentKeyFn({ id, organizationId }), queryFn: () => TournamentsService.getTournament({ id, organizationId }) });
export const prefetchUseUsersServiceListUsers = (queryClient: QueryClient) => queryClient.prefetchQuery({ queryKey: Common.UseUsersServiceListUsersKeyFn(), queryFn: () => UsersService.listUsers() });
export const prefetchUseUsersServiceGetUser = (queryClient: QueryClient, { id }: {
  id: number;
}) => queryClient.prefetchQuery({ queryKey: Common.UseUsersServiceGetUserKeyFn({ id }), queryFn: () => UsersService.getUser({ id }) });
