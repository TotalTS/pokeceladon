Route25LongHouse_Script:
	jp EnableAutoTextBoxDrawing

Route25LongHouse_TextPointers:
	dw_const Route25LongHouseSkaterText, TEXT_ROUTE25LONGHOUSE_SKATER
	def_text_pointers
	
Route25LongHouseSkaterText:
	text_asm
	CheckEvent EVENT_GOT_SKATEBOARD
    jr nz, .got_item
	ld hl, .Text
	call PrintText
	ld a, [wCurrentMenuItem]
	and a
	lb bc, SKATEBOARD, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedSkateboardText
	call PrintText
	SetEvent EVENT_GOT_SKATEBOARD
	jr .done
.bag_full
	ld hl, .NoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .KeepExploringTheWorldText
	call PrintText
.done
	jp TextScriptEnd

.Text:
	text_far _Route25LongHouseSkaterText
	text_end

.ReceivedSkateboardText:
	text_far _Route25LongHouseSkaterReceivedSkateboardText
	sound_get_item_1
	text_end

.KeepExploringTheWorldText:
	text_far _Route25LongHouseSkaterKeepExploringTheWorldText
	text_end

.NoRoomText:
	text_far _Route25LongHouseSkaterNoRoomText
	text_end
