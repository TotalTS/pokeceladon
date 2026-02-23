HomeDoor_Apply::
    ld a, [wCurMap]
    cp VERMILION_CITY
    jr nz, .check_viridian

    ld a, [wPlayerHomeLocation]
    cp HOME_VERMILION
    jr nz, .check_viridian

    ld a, $7c
    ld [wNewTileBlockID], a
    lb bc, 1, 7
    predef ReplaceTileBlock
    jp .done

.check_viridian:
    ld a, [wCurMap]
    cp VIRIDIAN_CITY
    jr nz, .check_pewter

    ld a, [wPlayerHomeLocation]
    cp HOME_VIRIDIAN
    jr nz, .check_pewter

    ld a, $7c
    ld [wNewTileBlockID], a
    lb bc, 12, 8
    predef ReplaceTileBlock

    ld a, $7e
    ld [wNewTileBlockID], a
    lb bc, 12, 9
    predef ReplaceTileBlock

    ld a, $20
    ld [wNewTileBlockID], a
    lb bc, 11, 8
    predef ReplaceTileBlock

    ld a, $21
    ld [wNewTileBlockID], a
    lb bc, 11, 9
    predef ReplaceTileBlock
    jp .done

.check_pewter:
    ld a, [wCurMap]
    cp PEWTER_CITY
    jr nz, .check_cerulean

    ld a, [wPlayerHomeLocation]
    cp HOME_PEWTER
    jr nz, .check_cerulean

    ld a, $3c
    ld [wNewTileBlockID], a
    lb bc, 2, 15
    predef ReplaceTileBlock

    ld a, $3d
    ld [wNewTileBlockID], a
    lb bc, 2, 16
    predef ReplaceTileBlock

    ld a, $38
    ld [wNewTileBlockID], a
    lb bc, 1, 15
    predef ReplaceTileBlock

    ld a, $39
    ld [wNewTileBlockID], a
    lb bc, 1, 16
    predef ReplaceTileBlock
    jp .done
	
.check_cerulean:
    ld a, [wCurMap]
    cp CERULEAN_CITY
    jr nz, .check_lavender

    ld a, [wPlayerHomeLocation]
    cp HOME_CERULEAN
    jr nz, .check_lavender

    ld a, $02
    ld [wNewTileBlockID], a
    lb bc, 5, 7
    predef ReplaceTileBlock
    jp .done
	
.check_lavender:
    ld a, [wCurMap]
    cp LAVENDER_TOWN
    jr nz, .check_celadon

    ld a, [wPlayerHomeLocation]
    cp HOME_LAVENDER
    jr nz, .check_celadon

    ld a, $02
    ld [wNewTileBlockID], a
    lb bc, 4, 1
    predef ReplaceTileBlock
	
    ld a, $03
    ld [wNewTileBlockID], a
    lb bc, 4, 2
    predef ReplaceTileBlock
    jp .done
	
.check_celadon:
    ld a, [wCurMap]
    cp CELADON_CITY
    jr nz, .check_saffron

    ld a, [wPlayerHomeLocation]
    cp HOME_CELADON
    jr nz, .check_saffron

    ld a, $7c
    ld [wNewTileBlockID], a
    lb bc, 4, 14
    predef ReplaceTileBlock
    jp .done
	
.check_saffron:
    ld a, [wCurMap]
    cp SAFFRON_CITY
    jr nz, .check_fuchsia

    ld a, [wPlayerHomeLocation]
    cp HOME_SAFFRON
    jr nz, .check_fuchsia

    ld a, $3c
    ld [wNewTileBlockID], a
    lb bc, 14, 6
    predef ReplaceTileBlock
	
    ld a, $3d
    ld [wNewTileBlockID], a
    lb bc, 14, 7
    predef ReplaceTileBlock
    jp .done
	
.check_fuchsia:
    ld a, [wCurMap]
    cp FUCHSIA_CITY
    jr nz, .check_cinnabar

    ld a, [wPlayerHomeLocation]
    cp HOME_FUCHSIA
    jr nz, .check_cinnabar

    ld a, $02
    ld [wNewTileBlockID], a
    lb bc, 13, 7
    predef ReplaceTileBlock
    jp .done
	
.check_cinnabar:
    ld a, [wCurMap]
    cp CINNABAR_ISLAND
    jr nz, .check_indigo

    ld a, [wPlayerHomeLocation]
    cp HOME_CINNABAR
    jr nz, .check_indigo

    ld a, $64
    ld [wNewTileBlockID], a
    lb bc, 6, 1
    predef ReplaceTileBlock
	
    ld a, $02
    ld [wNewTileBlockID], a
    lb bc, 6, 2
    predef ReplaceTileBlock
	
    ld a, $03
    ld [wNewTileBlockID], a
    lb bc, 6, 3
    predef ReplaceTileBlock

    ld a, $64
    ld [wNewTileBlockID], a
    lb bc, 7, 1
    predef ReplaceTileBlock
	
    ld a, $77
    ld [wNewTileBlockID], a
    lb bc, 7, 2
    predef ReplaceTileBlock
	
    ld a, $77
    ld [wNewTileBlockID], a
    lb bc, 7, 3
    predef ReplaceTileBlock
	
    ld a, $77
    ld [wNewTileBlockID], a
    lb bc, 7, 4
    predef ReplaceTileBlock
    jp .done
	
.check_indigo:
    ld a, [wCurMap]
    cp ROUTE_23
    jr nz, .done

    ld a, [wPlayerHomeLocation]
    cp HOME_INDIGO
    jr nz, .done

    ld a, $1d
    ld [wNewTileBlockID], a
    lb bc, 8, 0
    predef ReplaceTileBlock
	
    ld a, $1f
    ld [wNewTileBlockID], a
    lb bc, 8, 1
    predef ReplaceTileBlock
    jr .done

.done:
    ret
	
; warps

HomeWarp_Apply::
    ld a, [wWarpedFromWhichMap]
    cp CHAMPIONS_HOUSE_1F
    ret nz

    ld a, [wCurMap]
    cp VERMILION_CITY
    jr nz, .check_viridian

    ld a, [wPlayerHomeLocation]
    cp HOME_VERMILION
    jr nz, .check_viridian

    ld a, 9
    ld [wDestinationWarpID], a
    ret

.check_viridian:
    ld a, [wCurMap]
    cp VIRIDIAN_CITY
    jr nz, .check_pewter

    ld a, [wPlayerHomeLocation]
    cp HOME_VIRIDIAN
    jr nz, .check_pewter

    ld a, 5
    ld [wDestinationWarpID], a
    ret

.check_pewter:
    ld a, [wCurMap]
    cp PEWTER_CITY
    jr nz, .check_cerulean

    ld a, [wPlayerHomeLocation]
    cp HOME_PEWTER
    jr nz, .check_cerulean

    ld a, 7
    ld [wDestinationWarpID], a
    ret

.check_cerulean:
    ld a, [wCurMap]
    cp CERULEAN_CITY
    jr nz, .check_lavender

    ld a, [wPlayerHomeLocation]
    cp HOME_CERULEAN
    jr nz, .check_lavender

    ld a, 10
    ld [wDestinationWarpID], a
    ret

.check_lavender:
    ld a, [wCurMap]
    cp LAVENDER_TOWN
    jr nz, .check_celadon

    ld a, [wPlayerHomeLocation]
    cp HOME_LAVENDER
    jr nz, .check_celadon

    ld a, 6
    ld [wDestinationWarpID], a
    ret

.check_celadon:
    ld a, [wCurMap]
    cp CELADON_CITY
    jr nz, .check_saffron

    ld a, [wPlayerHomeLocation]
    cp HOME_CELADON
    jr nz, .check_saffron

    ld a, 14
    ld [wDestinationWarpID], a
    ret

.check_saffron:
    ld a, [wCurMap]
    cp SAFFRON_CITY
    jr nz, .check_fuchsia

    ld a, [wPlayerHomeLocation]
    cp HOME_SAFFRON
    jr nz, .check_fuchsia

    ld a, 8
    ld [wDestinationWarpID], a
    ret

.check_fuchsia:
    ld a, [wCurMap]
    cp FUCHSIA_CITY
    jr nz, .check_cinnabar

    ld a, [wPlayerHomeLocation]
    cp HOME_FUCHSIA
    jr nz, .check_cinnabar

    ld a, 9
    ld [wDestinationWarpID], a
    ret

.check_cinnabar:
    ld a, [wCurMap]
    cp CINNABAR_ISLAND
    jr nz, .check_indigo

    ld a, [wPlayerHomeLocation]
    cp HOME_CINNABAR
    jr nz, .check_indigo

    ld a, 5
    ld [wDestinationWarpID], a
    ret

.check_indigo:
    ld a, [wCurMap]
    cp ROUTE_23
    jr nz, .done

    ld a, [wPlayerHomeLocation]
    cp HOME_INDIGO
    jr nz, .done

    ld a, 4
    ld [wDestinationWarpID], a

.done:
    ret