// This file is auto-generated by @hey-api/openapi-ts

export const $Format = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
  },
} as const;

export const $Game = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
  },
  required: ["id", "name"],
} as const;

export const $GameDetail = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    formats: {
      type: "array",
      items: {
        $ref: "#/components/schemas/Format",
      },
    },
  },
  required: ["id", "name", "formats"],
} as const;

export const $PasswordRequest = {
  type: "object",
  properties: {
    password: {
      type: "string",
      minLength: 8,
      format: "password",
    },
    password_confirmation: {
      type: "string",
      minLength: 8,
      format: "password",
    },
  },
  required: ["password", "password_confirmation"],
} as const;

export const $ChangePasswordRequest = {
  allOf: [
    {
      $ref: "#/components/schemas/PasswordRequest",
    },
    {
      properties: {
        current_password: {
          type: "string",
          minLength: 8,
          format: "password",
        },
      },
      required: ["current_password"],
    },
  ],
} as const;

export const $User = {
  type: "object",
  properties: {
    username: {
      type: "string",
    },
    pronouns: {
      type: "string",
    },
    id: {
      type: "integer",
    },
  },
  required: ["username", "pronouns", "id", "username", "pronouns"],
} as const;

export const $UserDetails = {
  type: "object",
  properties: {
    username: {
      type: "string",
    },
    pronouns: {
      type: "string",
    },
    email: {
      type: "string",
    },
    first_name: {
      type: "string",
    },
    last_name: {
      type: "string",
    },
    id: {
      type: "integer",
    },
  },
  required: [
    "id",
    "email",
    "first_name",
    "last_name",
    "email",
    "first_name",
    "last_name",
    "username",
    "pronouns",
  ],
} as const;

export const $UserPostRequest = {
  type: "object",
  properties: {
    username: {
      type: "string",
    },
    pronouns: {
      type: "string",
    },
    email: {
      type: "string",
    },
    first_name: {
      type: "string",
    },
    last_name: {
      type: "string",
    },
    id: {
      type: "integer",
    },
    password: {
      type: "string",
      minLength: 8,
      format: "password",
    },
    password_confirmation: {
      type: "string",
      minLength: 8,
      format: "password",
    },
  },
  required: [
    "password",
    "password_confirmation",
    "email",
    "first_name",
    "last_name",
    "username",
    "pronouns",
  ],
} as const;

export const $UserRequest = {
  type: "object",
  properties: {
    username: {
      type: "string",
    },
    pronouns: {
      type: "string",
    },
    email: {
      type: "string",
    },
    first_name: {
      type: "string",
    },
    last_name: {
      type: "string",
    },
    id: {
      type: "integer",
    },
    current_password: {
      type: "string",
      minLength: 8,
      format: "password",
    },
  },
  required: [
    "current_password",
    "email",
    "first_name",
    "last_name",
    "username",
    "pronouns",
  ],
} as const;

export const $Organization = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    owner: {
      $ref: "#/components/schemas/User",
    },
  },
  required: ["id", "name", "owner"],
} as const;

export const $OrganizationDetails = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    owner: {
      $ref: "#/components/schemas/UserDetails",
    },
    updated_at: {
      type: "string",
      format: "date-time",
    },
    created_at: {
      type: "string",
      format: "date-time",
    },
  },
  required: ["id", "name", "owner", "description", "created_at", "updated_at"],
} as const;

export const $Tournament = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    player_cap: {
      type: "integer",
      nullable: true,
    },
  },
  required: ["id", "name", "player_cap"],
} as const;

export const $TournamentDetails = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    player_cap: {
      type: "integer",
      nullable: true,
    },
    autostart: {
      type: "boolean",
    },
    start_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    end_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    started_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    ended_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    late_check_in: {
      type: "boolean",
    },
    check_in_start_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    late_registration: {
      type: "boolean",
    },
    registration_start_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    registration_end_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    teamlists_required: {
      type: "boolean",
    },
    open_team_sheets: {
      type: "boolean",
    },
  },
  required: [
    "id",
    "name",
    "player_cap",
    "start_at",
    "player_cap",
    "autostart",
    "teamlists_required",
    "open_team_sheets",
    "late_check_in",
    "check_in_start_at",
    "late_registration",
    "registration_start_at",
    "registration_end_at",
  ],
} as const;

export const $Pokemon = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    nickname: {
      type: "string",
      nullable: true,
    },
    ability: {
      type: "string",
    },
    tera_type: {
      type: "string",
    },
    nature: {
      type: "string",
    },
    held_item: {
      type: "string",
      nullable: true,
    },
    move1: {
      type: "string",
      nullable: true,
    },
    move2: {
      type: "string",
      nullable: true,
    },
    move3: {
      type: "string",
      nullable: true,
    },
    move4: {
      type: "string",
      nullable: true,
    },
  },
  required: [
    "id",
    "name",
    "ability",
    "tera_type",
    "nature",
    "held_item",
    "move1",
    "move2",
    "move3",
    "move4",
  ],
} as const;

export const $PlayerRequest = {
  type: "object",
  properties: {
    user_id: {
      type: "integer",
    },
    in_game_name: {
      type: "string",
    },
  },
  required: ["user_id", "in_game_name"],
} as const;

export const $Player = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    user: {
      $ref: "#/components/schemas/User",
    },
    in_game_name: {
      type: "string",
    },
  },
  required: ["id", "user", "in_game_name"],
} as const;

export const $PlayerDetails = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    user: {
      $ref: "#/components/schemas/User",
    },
    in_game_name: {
      type: "string",
    },
  },
  required: ["id", "user", "in_game_name"],
} as const;

export const $Round = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    phase_id: {
      type: "integer",
    },
    round_number: {
      type: "integer",
    },
    started_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    ended_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
  },
  required: ["id", "phase_id", "round_number", "started_at", "ended_at"],
} as const;

export const $Phase = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    order: {
      type: "integer",
    },
    type: {
      type: "string",
    },
    tournament_id: {
      type: "integer",
    },
    number_of_rounds: {
      type: "integer",
    },
    best_of: {
      type: "integer",
    },
    criteria: {
      type: "string",
      nullable: true,
    },
    started_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    ended_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    created_at: {
      type: "string",
      format: "date-time",
    },
    updated_at: {
      type: "string",
      format: "date-time",
    },
  },
  required: [
    "id",
    "name",
    "order",
    "tournament_id",
    "number_of_rounds",
    "best_of",
    "criteria",
    "started_at",
    "ended_at",
  ],
} as const;

export const $PhaseDetails = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
    order: {
      type: "integer",
    },
    type: {
      type: "string",
    },
    tournament_id: {
      type: "integer",
    },
    number_of_rounds: {
      type: "integer",
    },
    best_of: {
      type: "integer",
    },
    criteria: {
      type: "string",
      nullable: true,
    },
    started_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    ended_at: {
      type: "string",
      format: "date-time",
      nullable: true,
    },
    created_at: {
      type: "string",
      format: "date-time",
    },
    updated_at: {
      type: "string",
      format: "date-time",
    },
    players: {
      type: "array",
      items: {
        $ref: "#/components/schemas/Player",
      },
    },
    rounds: {
      type: "array",
      items: {
        $ref: "#/components/schemas/Round",
      },
    },
  },
  required: [
    "id",
    "name",
    "order",
    "tournament_id",
    "number_of_rounds",
    "best_of",
    "criteria",
    "started_at",
    "ended_at",
    "players",
    "rounds",
  ],
} as const;

export const $GameRequest = {
  type: "object",
  properties: {
    id: {
      type: "integer",
    },
    name: {
      type: "string",
    },
  },
  required: ["name"],
} as const;

export const $UserLoginRequest = {
  type: "object",
  properties: {
    email: {
      type: "string",
      format: "email",
    },
    password: {
      type: "string",
      minLength: 8,
      format: "password",
    },
  },
  required: ["email", "password"],
} as const;
